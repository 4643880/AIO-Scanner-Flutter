import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/config/routes.dart';
import 'package:ocr_app/controller/business_card_controller.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/helper/hive_boxes.dart';
import 'package:ocr_app/models/history_model.dart';
import 'package:ocr_app/screens/results/components/contact_detected.dart';
import 'package:ocr_app/screens/results/components/contact_text_field.dart';
import 'package:ocr_app/screens/results/components/result_text_widget.dart';
import 'package:ocr_app/utils/extra_function.dart';
import 'package:ocr_app/utils/util.dart';
import 'dart:developer' as devtools show log;

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}

class BusinessCardResultScreen extends StatefulWidget {
  BusinessCardResultScreen({super.key});

  @override
  State<BusinessCardResultScreen> createState() =>
      _BusinessCardResultScreenState();
}

class _BusinessCardResultScreenState extends State<BusinessCardResultScreen> {
  final _formKey = GlobalKey<FormState>();
  String? path = Get.arguments;
  String allText = "";
  late final InputImage inputImage;

  @override
  void initState() {
    super.initState();
    inputImage = InputImage.fromFilePath(path!);
    waitForProcessing();
  }

  Future<void> waitForProcessing() async {
    await processImage(inputImage).whenComplete(() {
      findData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // log(_nameController.text);
    return GetBuilder<BusinessCardController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            AppTexts.results,
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          iconTheme: const IconThemeData(
            color: AppColors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Clipboard.setData(const ClipboardData(text: "Lorem Ipsum"));
                Utils.showSnackBar(
                  title: "Text Copied",
                  desc: "You have successfully copied the text.",
                  direction: SnackPosition.BOTTOM,
                );
              },
              icon: Image.asset(
                AppAssets.copy,
                height: 32.w,
                width: 32.w,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.share,
                height: 32.w,
                width: 32.w,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResultTextWidget(
                      text: Get.find<BusinessCardController>().allText.value,
                    ),
                    VerticalSpacer(space: 16.h),
                    ContactDetectedSection(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          devtools.log("All Good");
                          await saveContactInPhone(
                            name: Get.find<BusinessCardController>()
                                .nameController
                                .text,
                            email: Get.find<BusinessCardController>()
                                .emailController
                                .text,
                            number: Get.find<BusinessCardController>()
                                .numberController
                                .text,
                            address: Get.find<BusinessCardController>()
                                .addressController
                                .text,
                          ).whenComplete(() {
                            Utils.showSnackBar(
                              title: "Contact Saved",
                              desc: "Contact Number has successfully saved.",
                              direction: SnackPosition.TOP,
                            );
                            Get.toNamed(routeHome);
                          });
                        } else {
                          devtools.log("Error");
                        }
                      },
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            label: AppTexts.nameField,
                            controller: controller.nameController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.length < 3) {
                                  return "Please enter a valid name.";
                                }
                              } else {
                                return "Name can't be empty.";
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            label: AppTexts.phoneField,
                            controller: Get.find<BusinessCardController>()
                                .numberController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.length < 7) {
                                  return "Please Enter Correct Phone Number.";
                                }
                              } else {
                                return "Phone Number can't be empty.";
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            label: AppTexts.emailField,
                            controller: Get.find<BusinessCardController>()
                                .emailController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                devtools.log("reached here");
                                if (value.length < 7) {
                                  return "Please Enter Correct Email Address.";
                                } else if (!value.isValidEmail) {
                                  return "Please Enter Correct Email Address.";
                                }
                              } else {
                                return null; // Because it's optional
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            label: AppTexts.addressField,
                            controller: Get.find<BusinessCardController>()
                                .addressController,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (value.length < 8) {
                                  return "Please enter Address name.";
                                }
                              } else {
                                return null;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    Utils.showLoading("Please Wait.");

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    Get.find<BusinessCardController>().allText.value = recognizedText.text;
    Get.find<BusinessCardController>().update();

    final data = HistoryModel(
      text: recognizedText.text,
      dateTime: DateTime.now().toString(),
      type: "bs",
    );
    final box = Boxes.getHistory();
    box.add(data);

    data.save();

    Utils.dismiss();
  }
}
