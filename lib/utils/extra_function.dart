import 'dart:developer';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ocr_app/controller/business_card_controller.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/utils/util.dart';
import 'dart:developer' as devtools show log;

import 'package:permission_handler/permission_handler.dart';

String formatDate(String inputDate) {
  // Parse the input date string into a DateTime object
  DateTime dateTime = DateTime.parse(inputDate);

  // Create a DateFormat instance for the desired output format
  DateFormat outputFormat = DateFormat('d MMM, y • h:mm a');

  // Format the DateTime object using the desired output format
  String formattedDate = outputFormat.format(dateTime);

  return formattedDate;
}

String? simpleValidator(String? value, String? validationMsg, {Map? getMap}) {
  // if (Get.find<JobController>()
  //     .listToCollectValidationErrorsModel
  //     .contains(model)) {
  //   Get.find<JobController>().listToCollectValidationErrors.remove(model ?? "");
  // }
  value = value.toString().trim();
  if (value == 'null' || value.isEmpty) {
    return validationMsg ?? "empty_field";
  }
  return null;
}

Future<String> pickImage({ImageSource? source}) async {
  final picker = ImagePicker();

  String path = '';

  try {
    final getImage = await picker.pickImage(source: source!);

    if (getImage != null) {
      path = getImage.path;
    } else {
      path = '';
    }
  } catch (e) {
    log(e.toString());
  }

  return path;
}

void findData() {
  final mylist = Get.find<BusinessCardController>().allText.value.split("\n");
  // devtools.log(widget.text);
  devtools.log("=========>" + mylist.toString());

  // devtools.log(strings.length.toString());
  Future.forEach(mylist, (element) async {
    await recognizeAddress(element);
    // if (selectedAddress.isNotEmpty) {
    // devtools.log(selectedAddress.toString());
    // }
  });

  final result = findEmail(mylist);
  devtools.log(result.toString());

  final result2 = findPhoneNumber(mylist);
  devtools.log(result2.toString());

  final result3 = findCompanyNameOrOwnerName(mylist);
  devtools.log(result3.toString());
}

String? findCompanyNameOrOwnerName(List<String> myList) {
  RegExp namePattern = RegExp(r'^(?:[A-Z][a-z]*\s?)+$');

  for (String str in myList) {
    if (namePattern.hasMatch(str)) {
      log("str =$str");
      Get.find<BusinessCardController>().nameController.text = str;
      Get.find<BusinessCardController>().update();
      // devtools.log("Matched: $str");
    } else {
      print("Not Matched: $str");
    }
  }

  return null;
}

String? findPhoneNumber(List<String> numbersList) {
  RegExp phoneNumberRegex = RegExp(
    r'(\+\d{1,2}\s?)?(\(\d{3}\)|\d{3})[-.\s]?\d{3}[-.\s]?\d{4}',
  );

  for (String str in numbersList) {
    String? phoneNumber = phoneNumberRegex.stringMatch(str);
    if (phoneNumber != "" && phoneNumber != null) {
      Get.find<BusinessCardController>().numberController.text = phoneNumber;
      Get.find<BusinessCardController>().update();
      devtools.log('Phone number found: $phoneNumber');
      break;
    } else {
      print('No phone number found in: $str');
    }
  }
  return null;
}

String? findEmail(List<String> strings) {
  RegExp emailRegExp =
      RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
  for (String str in strings) {
    final trimmedStr = str.trim().replaceAll(" ", "").toLowerCase();
    if (emailRegExp.hasMatch(trimmedStr)) {
      Get.find<BusinessCardController>().emailController.text = trimmedStr;
      Get.find<BusinessCardController>().update();
      return emailRegExp.stringMatch(trimmedStr);
    }
  }
  return null;
}

Future<void> recognizeAddress(String addressString) async {
  try {
    final query = addressString;
    final addresses = await Geocoder.local.findAddressesFromQuery(query);
    if (addresses.isNotEmpty) {
      final firstAddress = addresses.first;
      // setState(() {
      //   // selectedAddress = firstAddress.addressLine ?? "Not Found";
      //   selectedAddress = firstAddress.addressLine!;
      //   _addressController.text = selectedAddress;
      // });

      Get.find<BusinessCardController>().addressController.text =
          firstAddress.addressLine!;
      Get.find<BusinessCardController>().update();
    } else {
      // devtools.log("Address Not Found");
    }
  } catch (e) {
    // devtools.log("Address Not Found");
    // devtools.log(e.toString());
  }
}

Future<String> imageCropperView(String? path, BuildContext context) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: path!,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: AppColors.primary,
        toolbarWidgetColor: Colors.white,
        activeControlsWidgetColor: AppColors.primary,
        // cropGridColor: Colors.red,
        // statusBarColor: Colors.yellow,
        // cropFrameColor: Colors.orange,
        // backgroundColor: Colors.amber,
        // dimmedLayerColor: Colors.pink,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        title: 'Crop Image',
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );

  if (croppedFile != null) {
    log("Image cropped");
    return croppedFile.path;
  } else {
    log("Do nothing");
    return '';
  }
}

Future<void> saveContactInPhone({
  String? name,
  String? email,
  String? number,
  String? address,
}) async {
  try {
    print("saving Contact");
    Utils.showLoading("Please Wait.");
    PermissionStatus permission = await Permission.contacts.status;

    if (permission != PermissionStatus.granted) {
      await Permission.contacts.request();
      PermissionStatus permission = await Permission.contacts.status;

      if (permission == PermissionStatus.granted) {
        Contact newContact = Contact();

        newContact.givenName = name;
        newContact.emails = [Item(label: "email", value: email)];
        newContact.postalAddresses = [
          PostalAddress(
            label: "address",
            street: address,
          )
        ];
        newContact.phones = [Item(label: "mobile", value: number)];
        devtools.log(
          "name: $name -- email: $email -- phone: $number -- address: $address",
        );

        await ContactsService.addContact(newContact);
      } else {
        //_handleInvalidPermissions(context);
      }
    } else {
      Contact newContact = Contact();

      newContact.givenName = name;
      newContact.emails = [Item(label: "email", value: email)];
      newContact.postalAddresses = [
        PostalAddress(
          label: "address",
          street: address,
        )
      ];
      newContact.phones = [Item(label: "mobile", value: number)];
      devtools.log(
        "name: $name -- email: $email -- phone: $number -- address: $address",
      );

      await ContactsService.addContact(newContact);
    }
    print("object");
    Utils.dismiss();
  } catch (e) {
    Utils.dismiss();
    print(e);
  }
}
