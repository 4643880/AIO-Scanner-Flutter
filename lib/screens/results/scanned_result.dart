import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr_app/controller/business_card_controller.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/helper/hive_boxes.dart';
import 'package:ocr_app/models/history_model.dart';
import 'package:ocr_app/screens/results/components/result_text_widget.dart';
import 'package:ocr_app/utils/util.dart';
import 'package:share_plus/share_plus.dart';

class ScannedResultScreen extends StatefulWidget {
  @override
  State<ScannedResultScreen> createState() => _ScannedResultScreenState();
}

class _ScannedResultScreenState extends State<ScannedResultScreen> {
  String? path = Get.arguments;
  bool _isBusy = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final InputImage inputImage = InputImage.fromFilePath(path!);
    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Clipboard.setData(ClipboardData(text: controller.text));
              Utils.showSnackBar(
                title: "Text Copied",
                desc: "You have successfully copied the text.",
                direction: SnackPosition.BOTTOM,
              );
            },
            icon: const Icon(
              Icons.copy_all,
              color: AppColors.black,
            ),
            // icon: Image.asset(
            //   AppAssets.copy,
            //   height: 32.w,
            //   width: 32.w,
            // ),
          ),
          IconButton(
            onPressed: () async {
              await Share.shareWithResult(controller.text);
            },
            icon: const Icon(
              Icons.share,
              color: AppColors.black,
            ),
            // icon: Image.asset(
            //   AppAssets.share,
            //   height: 32.w,
            //   width: 32.w,
            // ),
          ),
        ],
      ),
      body: _isBusy == true
          ? const SizedBox()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ResultTextWidget(
                  text: controller.text,
                ),
              ),
            ),
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    Utils.showLoading("Please Wait.");
    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    controller.text = recognizedText.text;

    final data = HistoryModel(
      text: recognizedText.text,
      dateTime: DateTime.now().toString(),
      type: "doc",
    );
    final box = Boxes.getHistory();
    box.add(data);
    await data.save();

    await Get.find<BusinessCardController>().getLengthOfHistory();

    ///End busy state
    setState(() {
      _isBusy = false;
    });
    Utils.dismiss();
  }
}
