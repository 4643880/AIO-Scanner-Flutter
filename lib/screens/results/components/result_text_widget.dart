import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/helper/app_colors.dart';

class ResultTextWidget extends StatelessWidget {
  final String text;
  const ResultTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        height: 1.6,
        color: AppColors.resultText,
      ),
      textAlign: TextAlign.left,
    );
  }
}
