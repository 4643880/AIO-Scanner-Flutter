import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocr_app/controller/business_card_controller.dart';
import 'package:ocr_app/utils/extra_function.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  FormFieldValidator<String>? validator;
  FormFieldSetter<String>? onSaved;
  void Function(String? text)? onChanged;
  final TextEditingController controller;
  CustomTextField({
    this.onChanged,
    this.onSaved,
    this.validator,
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.r,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 20.h,
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff42597A),
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.only(bottom: 16.r),
            // height: 24.h,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffC7D1D9),
                ),
              ),
            ),
            child: TextFormField(
              validator: validator,
              onSaved: onSaved,
              onChanged: onChanged,
              controller: controller,
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
              ),
              maxLines: null,
              // keyboardType: TextInputType.multiline,
              minLines: 1,
              // maxLength: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
