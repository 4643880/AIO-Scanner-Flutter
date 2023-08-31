import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/models/history_model.dart';
import 'package:ocr_app/screens/results/components/result_text_widget.dart';
import 'package:ocr_app/utils/util.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatelessWidget {
  HistoryModel eachItem = Get.arguments;
  ResultScreen({super.key});

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
              Clipboard.setData(ClipboardData(text: eachItem.text ?? ""));
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
          ),
          IconButton(
            onPressed: () async {
              await Share.shareWithResult(eachItem.text ?? "");
            },
            icon: const Icon(
              Icons.share,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ResultTextWidget(
            text: eachItem.text ?? "",
          ),
        ),
      ),
    );
  }
}
