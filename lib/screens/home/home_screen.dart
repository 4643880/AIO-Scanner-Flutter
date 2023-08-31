import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/helper/hive_boxes.dart';
import 'package:ocr_app/screens/home/components/custom_app_bar.dart';
import 'package:ocr_app/screens/home/components/custom_bottom_bar.dart';
import 'package:ocr_app/screens/home/components/custom_empty_data.dart';
import 'package:ocr_app/screens/home/components/custom_history_widget.dart';
import 'package:ocr_app/screens/home/components/custom_tip_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          height: 1.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: AppTexts.appName,
              ),
              Boxes.getHistory().values.toList().isNotEmpty
                  ? Expanded(
                      child: Column(
                        children: [
                          CutomTipWidget(
                            onDismiss: (value) {
                              return value;
                            },
                          ),
                          const Expanded(child: MainHistoryWidget()),
                        ],
                      ),
                    )
                  : const NoDataWidget(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
