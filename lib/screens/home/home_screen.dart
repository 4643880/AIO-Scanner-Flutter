import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/screens/home/components/custom_app_bar.dart';
import 'package:ocr_app/screens/home/components/custom_bottom_bar.dart';
import 'package:ocr_app/screens/home/components/custom_empty_data.dart';
import 'package:ocr_app/screens/home/components/custom_history_label.dart';
import 'package:ocr_app/screens/home/components/custom_history_widget.dart';
import 'package:ocr_app/screens/home/components/custom_img_with_title_desc.dart';
import 'package:ocr_app/screens/home/components/custom_scanned_document.dart';
import 'package:ocr_app/screens/home/components/custom_tip_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: AppTexts.appName,
              ),
              Column(
                children: [
                  MainHistoryWidget(),
                  NoDataWidget(),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
