import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';

class ImageWithTitleAndDesc extends StatelessWidget {
  final String img;
  final String title;
  final String desc;
  const ImageWithTitleAndDesc({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 1.sw,
      child: Column(
        children: [
          Image.asset(
            img,
            width: 360.w,
            height: 300.h,
          ),
          VerticalSpacer(
            space: 24.h,
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          VerticalSpacer(
            space: 04.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Text(
              desc,
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
