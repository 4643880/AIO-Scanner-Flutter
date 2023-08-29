import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 56.h,
      padding: EdgeInsets.symmetric(vertical: 12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
