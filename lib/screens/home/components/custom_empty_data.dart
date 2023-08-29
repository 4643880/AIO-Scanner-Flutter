import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/screens/home/components/custom_img_with_title_desc.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacer(space: 24.h),
        const ImageWithTitleAndDesc(
          img: AppAssets.homeImg,
          title: AppTexts.suchEmpty,
          desc: AppTexts.homeDesc,
        ),
      ],
    );
  }
}
