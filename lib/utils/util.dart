
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// class Util {
//   static String stripHtmlIfNeeded(String? text) {
//     return text!.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
//   }

//   static void showToast(String message) {
//     EasyLoading.showToast(
//       message,
//       duration: const Duration(seconds: 3),
//       toastPosition: EasyLoadingToastPosition.bottom,
//       dismissOnTap: true,
//       maskType: EasyLoadingMaskType.clear,
//     );
//   }

//   static void showLoading(String message) {
//     EasyLoading.show(
//       status: message,
//       indicator: const CircularProgressIndicator.adaptive(
//         backgroundColor: AppColors.white,
//       ),
//       dismissOnTap: false,
//       maskType: EasyLoadingMaskType.clear,
//     );
//   }

//   static void showErrorSnackBar(String message) {
//     //Form Closing all previous SnackBars
//     // if (Get.isSnackbarOpen) {
//     //   Get.closeAllSnackbars();
//     // }
//     Get.snackbar(
//       "",
//       "",
//       duration: const Duration(milliseconds: 1200),
//       snackPosition: SnackPosition.BOTTOM,
//       titleText: Text(
//         message,
//         style: AppTextStyle.bodyNormalRegular.copyWith(color: AppColors.white),
//       ),
//       messageText: const SizedBox(),
//       padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
//       margin: EdgeInsets.only(bottom: 60.h, left: 16.w, right: 16.w),
//       backgroundColor: AppColors.textPrimary,
//     );
//   }

//   static void setEasyLoading() {
//     EasyLoading.instance
//       ..textColor = AppColors.white
//       ..indicatorSize = 22.w
//       ..indicatorColor = AppColors.textPrimary
//       ..indicatorType = EasyLoadingIndicatorType.foldingCube
//       ..userInteractions = false
//       ..dismissOnTap = false
//       ..backgroundColor = AppColors.white
//       ..animationStyle = EasyLoadingAnimationStyle.opacity
//       ..animationDuration = const Duration(milliseconds: 400);
//   }

//   static void dismiss() {
//     EasyLoading.dismiss();
//   }

//   static void authPopup(BuildContext context, String title, subTitle) {
//     showDialog(
//       context: context,
//       barrierColor: AppColors.otherBackdrop,
//       builder: (context) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
//           title: Text(
//             title,
//             style: AppTextStyle.headingH6.copyWith(
//                 color: AppColors.textPrimary, fontWeight: FontWeight.w600),
//           ),
//           content: Text(
//             subTitle,
//             style: AppTextStyle.bodyNormalRegular.copyWith(
//                 fontWeight: FontWeight.w400, color: AppColors.textSecondary),
//           ),
//           actions: [
//             TextButton(
//               child: Text(
//                 'OKAY',
//                 style: AppTextStyle.bodySmallRegular.copyWith(
//                     fontWeight: FontWeight.w500, color: AppColors.primaryMain),
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   static void filterBottomSheet() {
//     SfRangeValues _values = const SfRangeValues(40.0, 80.0);
//     List<String> selectedValues = [];
//     List<String> brands = [
//       'Nurpur',
//       'Milkpak',
//       'Nestle',
//       'Mitchells',
//       'Olpers'
//     ];

//     Get.bottomSheet(
//         isScrollControlled: true,
//         ignoreSafeArea: false,
//         isDismissible: true,
//         enableDrag: true,
//         enterBottomSheetDuration: const Duration(milliseconds: 200),
//         exitBottomSheetDuration: const Duration(milliseconds: 200),
//         barrierColor: AppColors.textPrimary.withOpacity(0.8),
//         backgroundColor: AppColors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(32.r),
//             topRight: Radius.circular(32.r),
//           ),
//         ),
//         FractionallySizedBox(
//           heightFactor: 0.90,
//           child: StatefulBuilder(builder: (context, StateSetter setState) {
//             return Container(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   VerticalSpacer(space: 16.h),
//                   Center(child: SvgPicture.asset(AppAssets.indicatorSvg)),
//                   VerticalSpacer(space: 16.h),
//                   Row(
//                     children: [
//                       SvgPicture.asset(AppAssets.closeSvg),
//                       HorizontalSpacer(space: 16.w),
//                       Text(
//                         AppTexts.filters.toString().toUpperCase(),
//                         style: AppTextStyle.headingH6,
//                       ),
//                       const Spacer(),
//                       Text(
//                         AppTexts.clearAll.toString().toUpperCase(),
//                         style: AppTextStyle.bodySmallRegular.copyWith(
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.error),
//                       ),
//                     ],
//                   ),
//                   VerticalSpacer(space: 48.h),
//                   Row(
//                     children: [
//                       Text(
//                         AppTexts.pricing.toString().toUpperCase(),
//                         style: AppTextStyle.bodySmallRegular.copyWith(
//                             color: AppColors.textSecondary,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       const Spacer(),
//                       Text(
//                         AppTexts.clear.toString().toUpperCase(),
//                         style: AppTextStyle.bodySuccessRegular.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.error),
//                       ),
//                     ],
//                   ),
//                   SfRangeSlider(
//                     min: 0.0,
//                     max: 100.0,
//                     values: _values,
//                     showLabels: true,
//                     enableTooltip: true,
//                     activeColor: AppColors.primaryMain,
//                     inactiveColor: AppColors.primaryMain.withOpacity(0.38),
//                     onChanged: (SfRangeValues values) {
//                       setState(() {
//                         _values = values;
//                       });
//                     },
//                   ),
//                   VerticalSpacer(space: 20.h),
//                   Row(
//                     children: [
//                       Text(
//                         AppTexts.brands.toString().toUpperCase(),
//                         style: AppTextStyle.bodySmallRegular.copyWith(
//                             color: AppColors.textSecondary,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       const Spacer(),
//                       Text(
//                         AppTexts.clear.toString().toUpperCase(),
//                         style: AppTextStyle.bodySuccessRegular.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.error),
//                       ),
//                     ],
//                   ),
//                   VerticalSpacer(space: 20.h),
//                   ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: brands.length,
//                       itemBuilder: (context, index) {
//                         return CommonCheckboxWidget(
//                           title: brands[index],
//                           isSelected: selectedValues.contains(brands[index])
//                               ? true
//                               : false,
//                           onPressed: () {
//                             if (selectedValues.contains(brands[index])) {
//                               setState(() {
//                                 selectedValues.remove(brands[index]);
//                               });
//                             } else {
//                               setState(() {
//                                 selectedValues.add(brands[index]);
//                               });
//                             }
//                           },
//                         );
//                       }),
//                   VerticalSpacer(space: 16.h),
//                   Text(
//                     AppTexts.viewMore.toString().toUpperCase(),
//                     style: AppTextStyle.bodySmallRegular.copyWith(
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.primaryMain),
//                   )
//                 ],
//               ),
//             );
//           }),
//         ));
//   }

//   static void quickAddBottomSheet() {
//     List<String> selectedValues = [];
//     List<String> selectedValuesType = [];

//     List<String> weight = [
//       '1kg',
//       '2kg',
//       '5kg',
//     ];
//     List<String> type = [
//       'Chilli',
//       'Simple',
//     ];

//     Get.bottomSheet(
//         isScrollControlled: true,
//         ignoreSafeArea: false,
//         isDismissible: true,
//         enableDrag: true,
//         enterBottomSheetDuration: const Duration(milliseconds: 200),
//         exitBottomSheetDuration: const Duration(milliseconds: 200),
//         barrierColor: AppColors.textPrimary.withOpacity(0.8),
//         backgroundColor: AppColors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(32.r),
//             topRight: Radius.circular(32.r),
//           ),
//         ),
//         FractionallySizedBox(
//           heightFactor: 0.75,
//           child: StatefulBuilder(builder: (context, StateSetter setState) {
//             return SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     VerticalSpacer(space: 16.h),
//                     Center(child: SvgPicture.asset(AppAssets.indicatorSvg)),
//                     VerticalSpacer(space: 16.h),
//                     Row(
//                       children: [
//                         GestureDetector(
//                             onTap: () {
//                               Get.back();
//                             },
//                             child: SvgPicture.asset(AppAssets.closeSvg)),
//                         HorizontalSpacer(space: 16.w),
//                         Text(
//                           AppTexts.quickAdd.toString().toUpperCase(),
//                           style: AppTextStyle.headingH6,
//                         ),
//                       ],
//                     ),
//                     VerticalSpacer(space: 48.h),
//                     // TODO :: ADD CACHE IMAGE HERE
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Image.asset(
//                             AppAssets.productImage,
//                             height: 120.h,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         HorizontalSpacer(space: 12.w),
//                         Expanded(
//                           child: Image.asset(
//                             AppAssets.productImage,
//                             height: 120.h,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ],
//                     ),
//                     VerticalSpacer(space: 16.h),
//                     Text(
//                       'Mitchells Carrot Pickle',
//                       style: AppTextStyle.bodyNormalRegular
//                           .copyWith(color: AppColors.textPrimary),
//                     ),
//                     VerticalSpacer(space: 4.h),

//                     RichText(
//                       text: TextSpan(
//                           text: 'Brand: ',
//                           style: AppTextStyle.bodyNormalRegular,
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: 'Mitchells',
//                                 style: AppTextStyle.bodyNormalRegular.copyWith(
//                                     color: AppColors.primaryMain,
//                                     decoration: TextDecoration.underline),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     // navigate to desired screen
//                                   })
//                           ]),
//                     ),
//                     VerticalSpacer(space: 4.h),

//                     RichText(
//                       text: TextSpan(
//                           text: 'Rs. 150',
//                           style: AppTextStyle.bodyNormalBold,
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: ' Rs. 150',
//                                 style: AppTextStyle.bodySuccessRegular.copyWith(
//                                     color: AppColors.textSecondary,
//                                     decoration: TextDecoration.lineThrough),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     // navigate to desired screen
//                                   })
//                           ]),
//                     ),
//                     VerticalSpacer(space: 16.h),
//                     Text(
//                       AppTexts.weight.toString().toUpperCase(),
//                       style: AppTextStyle.bodySmallRegular.copyWith(
//                           color: AppColors.textPrimary,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     VerticalSpacer(space: 12.h),
//                     SizedBox(
//                       height: 34.h,
//                       child: ListView.builder(
//                           itemCount: weight.length,
//                           shrinkWrap: true,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return CommonQuickAddSelectorWidget(
//                               title: weight[index],
//                               isSelected: selectedValues.contains(weight[index])
//                                   ? true
//                                   : false,
//                               onPressed: () {
//                                 if (selectedValues.contains(weight[index])) {
//                                   setState(() {
//                                     selectedValues.remove(weight[index]);
//                                   });
//                                 } else {
//                                   setState(() {
//                                     selectedValues.add(weight[index]);
//                                   });
//                                 }
//                               },
//                             );
//                           }),
//                     ),
//                     VerticalSpacer(space: 16.h),
//                     Text(
//                       AppTexts.type.toString().toUpperCase(),
//                       style: AppTextStyle.bodySmallRegular.copyWith(
//                           color: AppColors.textPrimary,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     VerticalSpacer(space: 12.h),
//                     SizedBox(
//                       height: 34.h,
//                       child: ListView.builder(
//                           itemCount: type.length,
//                           shrinkWrap: true,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return CommonQuickAddSelectorWidget(
//                               title: type[index],
//                               isSelected:
//                                   selectedValuesType.contains(type[index])
//                                       ? true
//                                       : false,
//                               onPressed: () {
//                                 if (selectedValuesType.contains(type[index])) {
//                                   setState(() {
//                                     selectedValuesType.remove(type[index]);
//                                   });
//                                 } else {
//                                   setState(() {
//                                     selectedValuesType.add(type[index]);
//                                   });
//                                 }
//                               },
//                             );
//                           }),
//                     ),
//                     VerticalSpacer(space: 32.h),
//                     CommonIncrementButton(
//                       incrementValue: "1",
//                       leftOnTap: () {},
//                       rightOnTap: () {},
//                       margin: 0.w,
//                       fromCart: true,
//                     ),
//                     VerticalSpacer(space: 16.h),

//                     CustomButton(
//                       title: AppTexts.addToCart.toString().toUpperCase(),
//                       isFill: true,
//                       isCenter: true,
//                       onPressed: () {
//                         Get.toNamed(routeCartCheckout);
//                       },
//                       buttonShouldDisable: false,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ));
//   }

//   static void voucherTermCondition(
//       BuildContext context, String title, subTitle) {
//     showDialog(
//       context: context,
//       barrierColor: AppColors.otherBackdrop,
//       builder: (context) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
//           title: Text(
//             title,
//             style: AppTextStyle.headingH6.copyWith(
//                 color: AppColors.textPrimary, fontWeight: FontWeight.w600),
//           ),
//           content: Text(
//             subTitle,
//             style: AppTextStyle.bodyNormalRegular.copyWith(
//                 fontWeight: FontWeight.w400, color: AppColors.textSecondary),
//           ),
//           actions: [
//             TextButton(
//               child: Text(
//                 'OKAY',
//                 style: AppTextStyle.bodySmallRegular.copyWith(
//                     fontWeight: FontWeight.w500, color: AppColors.primaryMain),
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // static String getTime(dynamic time) {
//   //   return DateFormat()
//   //       .add_jm()
//   //       .format(DateFormat("HH:mm:ss").parse(time));
//   // }
//   //
//   // static String getISOTime(dynamic time) {
//   //   return DateFormat()
//   //       .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
//   // }
//   //
//   // static String dateForNotif(String date) {
//   //   DateTime now = DateTime.parse(date);
//   //   return formatDate(now, [
//   //     dd,
//   //     ' ',
//   //     M,
//   //     ', ',
//   //     yyyy,
//   //
//   //   ]);
//   // }
//   //
//   // static String getISODate(String date) {
//   //   DateTime now = DateTime.parse(date);
//   //   return formatDate(now, [
//   //     D,
//   //     ', ',
//   //
//   //     dd,
//   //     ' ',
//   //     M,
//   //
//   //   ]);
//   // }
//   //
//   //
//   //
//   // static String geCompleteDate(dynamic date) {
//   //   String tempDate = DateFormat("EE, d MMM,").add_jm().format(date);
//   //   return tempDate;
//   // }

//   static void showNotificationOnAndroid(
//       RemoteMessage message, String title, String body, BuildContext context,
//       {required String payload}) {
//     Get.snackbar(
//       "",
//       "",
//       snackPosition: SnackPosition.TOP,
//       titleText: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           title,
//           textAlign: TextAlign.left,
//           style: AppTextStyle.bodyNormalBold.copyWith(),
//         ),
//       ),
//       messageText: body.isEmpty
//           ? const SizedBox()
//           : Text(
//               body,
//               textAlign: TextAlign.left,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: AppTextStyle.bodyNormalRegular.copyWith(),
//             ),
//       onTap: (value) async {
//         await onTapFgNotification(message, context);
//       },
//       boxShadows: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 5,
//           blurRadius: 7,
//           offset: const Offset(0, 3), // changes position of shadow
//         ),
//       ],
//       borderRadius: 16.r,
//       padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
//       margin: EdgeInsets.only(top: 44.h, left: 16.w, right: 16.w),
//       backgroundColor: AppColors.white,
//       icon: Align(
//         alignment: Alignment.topCenter,
//         child: Padding(
//           padding: EdgeInsets.only(right: 8.w),
//           child: Image.asset(
//             AppAssets.appIcon,
//           ),
//         ),
//       ),
//     );
//   }

//   static void showLogoutAlertDialog() {
//     Get.dialog(
//       AlertDialog(
//         contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//         backgroundColor: AppColors.white,
//         alignment: Alignment.center,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.r),
//           ),
//         ),
//         insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
//         content: SizedBox(
//           width: 358.w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: 24.h),
//                 child: Text(
//                   'Logout',
//                   style: AppTextStyle.headingH6,
//                 ),
//               ),
//               Text(
//                 'Are you sure you want to logout?',
//                 style: AppTextStyle.bodyNormalRegular.copyWith(
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: CustomButton(
//                     title: "Yes",
//                     isFill: true,
//                     onPressed: () async {
//                       await Get.find<AuthController>().logoutLocally();
//                     },
//                     isCenter: true,
//                     buttonShouldDisable: false),
//               ),
//               HorizontalSpacer(space: 10.h),
//               Expanded(
//                 flex: 2,
//                 child: CustomButton(
//                     title: "No",
//                     isFill: true,
//                     onPressed: () async {
//                       Get.back();
//                     },
//                     isCenter: true,
//                     buttonShouldDisable: false),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CommonQuickAddSelectorWidget extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final void Function() onPressed;

//   const CommonQuickAddSelectorWidget({
//     required this.isSelected,
//     required this.title,
//     required this.onPressed,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 14.w),
//         margin: EdgeInsets.only(right: 8.w),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16.r),
//             border: Border.all(
//               color: isSelected
//                   ? AppColors.primaryMain
//                   : AppColors.otherStroke.withOpacity(0.23),
//             ),
//             color: isSelected ? AppColors.primaryMain : AppColors.white),
//         child: Text(
//           title,
//           style: AppTextStyle.body13Regular.copyWith(
//               color: isSelected ? AppColors.white : AppColors.secondaryMain),
//         ),
//       ),
//     );
//   }
// }
