import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_text_style.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/screens/home/components/custom_icon_button.dart';

class CustomIconButtonWithTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomIconButtonWithTitle({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 65.w,
          width: 65.w,
          color: AppColors.primary,
          iconColor: AppColors.white,
          size: 50.r,
          icon: icon,
        ),
        VerticalSpacer(space: 10.h),
        Text(
          title,
          style: AppTextStyle.body13Regular,
        ),
      ],
    );
  }
}
