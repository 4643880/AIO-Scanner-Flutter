import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_text_style.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/screens/home/components/custom_button_with_title.dart';
import 'package:ocr_app/screens/home/components/custom_icon_button.dart';
import 'package:ocr_app/screens/home/components/custom_language_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          AppTexts.appName,
          style: AppTextStyle.homeAppBar,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          VerticalSpacer(space: 100.h),
          const CustomLanguageIcon(text: AppTexts.languageEnglish),
          VerticalSpacer(space: 80.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Document Scanner",
                      style: AppTextStyle.body15SemiBold,
                    ),
                    const Divider(
                        color: Colors.white, height: 3, thickness: 15),
                  ],
                ),
                VerticalSpacer(space: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      height: 100.w,
                      width: 100.w,
                      color: AppColors.primary,
                      iconColor: AppColors.white,
                      size: 80.r,
                      icon: Icons.camera_alt_rounded,
                    ),
                    CustomIconButton(
                      height: 100.w,
                      width: 100.w,
                      color: AppColors.primary,
                      iconColor: AppColors.white,
                      size: 80.r,
                      icon: Icons.image,
                    ),
                  ],
                ),
              ],
            ),
          ),
          VerticalSpacer(space: 60.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomIconButtonWithTitle(
                icon: Icons.qr_code_scanner,
                title: AppTexts.qrCode,
              ),
              CustomIconButtonWithTitle(
                icon: Icons.badge,
                title: AppTexts.businessCard,
              ),
              CustomIconButtonWithTitle(
                icon: Icons.update,
                title: AppTexts.history,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
