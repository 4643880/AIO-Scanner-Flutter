import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/config/routes.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/helper/hive_boxes.dart';
import 'package:ocr_app/models/history_model.dart';
import 'package:ocr_app/screens/home/components/custom_button_with_title.dart';
import 'dart:developer' as devtools show log;

import 'package:ocr_app/utils/extra_function.dart';
import 'package:ocr_app/utils/util.dart';

class CustomBottomBar extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonWithTitle(
            img: AppAssets.bs,
            icon: Icons.badge,
            title: AppTexts.contactCard,
            onTap: () {
              pickImage(source: ImageSource.camera).then((value) {
                if (value != '') {
                  imageCropperView(value, context).then((value) {
                    if (value != '') {
                      Get.toNamed(routeBusinessCardResult, arguments: value);
                    }
                  });
                } else {
                  Get.toNamed(routeHome);
                }
              });
              Get.toNamed(routeHome);
            },
          ),
          CustomButtonWithTitle(
            img: AppAssets.qr,
            icon: Icons.qr_code,
            title: AppTexts.qrCode,
            onTap: () {
              Get.toNamed(routeQrScanner);
            },
          ),
          CustomButtonWithTitle(
            img: AppAssets.collection,
            title: AppTexts.gallery,
            onTap: () {
              pickImage(source: ImageSource.gallery).then((value) {
                if (value != '') {
                  imageCropperView(value, context).then((value) {
                    if (value != '') {
                      Get.toNamed(routeScannedResult, arguments: value);
                    }
                  });
                } else {
                  Get.toNamed(routeHome);
                }
              });
              Get.toNamed(routeHome);
            },
          ),
          // HorizontalSpacer(space: 48.w),
          CustomButtonWithTitle(
            img: AppAssets.camera,
            title: AppTexts.camera,
            onTap: () async {
              pickImage(source: ImageSource.camera).then((value) {
                if (value != '') {
                  imageCropperView(value, context).then((value) {
                    if (value != '') {
                      Get.toNamed(routeScannedResult, arguments: value);
                    }
                  });
                } else {
                  Get.toNamed(routeHome);
                }
              });
              Get.toNamed(routeHome);

              // Get.toNamed(
              //   routeBusinessCardResult,
              // );
              // showMyDialog(context);-
              // final data = Boxes.getHistory().values.toList();
              // await Boxes.getHistory().deleteFromDisk();
              // data.forEach((element) {
              //   devtools.log(element.toJson().toString());
              // });
            },
          ),
        ],
      ),
    );
  }

  showMyDialog(BuildContext context) async {
    // setState(() {
    //   textController.clear();
    //   typeController.clear();
    // });
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add History"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // doc, qr, bar, bs are the types
                final data = HistoryModel(
                  text: textController.text,
                  dateTime: DateTime.now().toString(),
                  type: typeController.text,
                );
                final box = Boxes.getHistory();
                box.add(data);

                data.save();
                textController.clear();
                typeController.clear();
                final newData = Boxes.getHistory().values.toList();
                newData.forEach((element) {
                  devtools.log(element.toJson().toString());
                });

                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: textController,
                  decoration: const InputDecoration(
                      hintText: "Enter text", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: typeController,
                  decoration: const InputDecoration(
                      hintText: "type", border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
