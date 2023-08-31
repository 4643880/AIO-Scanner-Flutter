import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/components/spacers/common_spacers.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/helper/app_texts.dart';

class CutomTipWidget extends StatefulWidget {
  final Function(bool value)? onDismiss;

  const CutomTipWidget({
    super.key,
    this.onDismiss,
  });

  @override
  State<CutomTipWidget> createState() => _CutomTipWidgetState();
}

class _CutomTipWidgetState extends State<CutomTipWidget> {
  bool tempbool = false;
  @override
  Widget build(BuildContext context) {
    return tempbool
        ? const SizedBox()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            height: 68.h,
            color: const Color(0xffF3F2FD),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppAssets.info),
                        HorizontalSpacer(space: 14.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppTexts.tip,
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              AppTexts.tipDesc,
                              style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.onDismiss != null) {
                      setState(() {
                        tempbool = widget.onDismiss!(true);
                      });
                    }
                  },
                  child: Container(
                    child: Image.asset(AppAssets.tipDismiss),
                  ),
                )
              ],
            ),
          );
  }
}
