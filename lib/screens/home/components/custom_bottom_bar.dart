import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/screens/home/components/custom_button_with_title.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 91.r, right: 91.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomButtonWithTitle(
              img: AppAssets.collection,
              title: AppTexts.gallery,
            ),
            HorizontalSpacer(space: 48.w),
            const CustomButtonWithTitle(
              img: AppAssets.camera,
              title: AppTexts.camera,
            ),
          ],
        ),
      ),
    );
  }
}
