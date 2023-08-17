import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_text_style.dart';
import 'package:ocr_app/helper/app_texts.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: OnBoardingSlider(
        pageBackgroundColor: AppColors.secondary,
        headerBackgroundColor: AppColors.secondary,
        finishButtonText: 'Scan Now',
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: AppColors.primary,
        ),
        skipTextButton: Text(
          'Skip',
          style: AppTextStyle.skipOnBoarding,
        ),
        trailing: Text(
          'Scan Now',
          style: AppTextStyle.skipOnBoarding,
        ),
        background: [
          Padding(
            padding: EdgeInsets.only(left: 70.r, top: 120.r),
            child: SvgPicture.asset(
              AppAssets.getStart,
              width: 260.w,
              // height: 200.w,
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 70.r, top: 120.r),
            child: SvgPicture.asset(
              AppAssets.scanner,
              width: 260.w,
              // height: 200.w,
              alignment: Alignment.center,
            ),
          ),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480.w,
                ),
                Text(
                  AppTexts.getStarted,
                  style: AppTextStyle.titleOnBoarding,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480.w,
                ),
                Text(
                  AppTexts.scanNow,
                  style: AppTextStyle.titleOnBoarding,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
