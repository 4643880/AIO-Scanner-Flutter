import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/helper/app_colors.dart';

class CustomHistoryLabel extends StatelessWidget {
  const CustomHistoryLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 16.r,
        vertical: 08,
      ),
      child: Text(
        "History",
        style: GoogleFonts.roboto(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.historyText,
        ),
      ),
    );
  }
}
