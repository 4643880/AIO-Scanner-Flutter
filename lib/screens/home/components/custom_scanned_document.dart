import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/helper/app_assets.dart';
import 'package:ocr_app/screens/home/components/custom_history_label.dart';

class ScannedDocumentWidget extends StatelessWidget {
  final String text;
  final String date;
  final String type;
  const ScannedDocumentWidget({
    super.key,
    required this.text,
    required this.date,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.red,
          // height: 96.h,
          width: 1.sw,
          // padding: EdgeInsets.symmetric(
          //   vertical: 16.h,
          // ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Image.asset(
                  type == "doc"
                      ? AppAssets.document
                      : type == "qr"
                          ? AppAssets.qr
                          : type == "bar"
                              ? AppAssets.bar
                              : type == "bs"
                                  ? AppAssets.bs
                                  : AppAssets.document,
                  width: 24,
                  height: 24,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.green,
                    width: 280.w,
                    child: Text(
                      text,
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                    child: Text(
                      date,
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.r),
          child: const Divider(
            color: Color(0xffC7D1D9),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
