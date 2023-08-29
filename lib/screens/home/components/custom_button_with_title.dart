import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/helper/app_colors.dart';

class CustomButtonWithTitle extends StatelessWidget {
  final String img;
  final String title;
  const CustomButtonWithTitle({
    super.key,
    required this.img,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.w,
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.w,
            width: 40.w,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              img,
              width: 24.w,
              height: 24.w,
            ),
          ),
          VerticalSpacer(
            space: 08.h,
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
