import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/constant.dart';
import 'package:ocr_app/helper/app_colors.dart';

class AppTextStyle {
  static final dynamic titleOnBoarding = GoogleFonts.plusJakartaSans(
    fontSize: kFontSize48,
    fontWeight: FontWeight.w900,
    color: AppColors.white,
  );

  static final dynamic skipOnBoarding = GoogleFonts.inter(
    fontSize: kFontSize14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static final dynamic homeAppBar = GoogleFonts.inter(
    fontSize: kFontSize20,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final TextStyle title = TextStyle(
    fontSize: kFontSize48,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle headingH5 = TextStyle(
    fontSize: kFontSize24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle headingH6 = TextStyle(
    fontSize: kFontSize20,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle captionSmall = TextStyle(
    fontSize: kFontSize10,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle captionRegular = TextStyle(
    fontSize: kFontSize12,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    // fontFamily: kJost,
  );

  static final TextStyle captionMedium = TextStyle(
    fontSize: kFontSize12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle subtitle = TextStyle(
    fontSize: kFontSize14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle captionBold = TextStyle(
    fontSize: kFontSize12,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    // fontFamily: kJost,
  );

  static final TextStyle bodyNormalRegular = TextStyle(
    fontSize: kFontSize16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    // fontFamily: kJost,
  );

  static final TextStyle bodyNormalBold = TextStyle(
    fontSize: kFontSize16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle body15SemiBold = TextStyle(
    fontSize: kFontSize15,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    // fontFamily: kJost,
  );

  static final TextStyle bodySmallBold = TextStyle(
    fontSize: kFontSize14,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle bodySmallRegular = TextStyle(
    fontSize: kFontSize14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    // fontFamily: kJost,
  );
  static final TextStyle bodySuccessRegular = TextStyle(
    fontSize: kFontSize12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    // fontFamily: kJost,
  );

  static final TextStyle body13Regular = TextStyle(
    fontSize: kFontSize13,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    // fontFamily: kJost,
  );
}
