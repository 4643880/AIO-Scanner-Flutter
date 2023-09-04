import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_app/controller/business_card_controller.dart';
import 'package:ocr_app/screens/home/home_screen.dart';
import 'package:ocr_app/screens/onboarding/onboarding_screen.dart';
import 'package:ocr_app/screens/qr%20scanner/qr_scanner.dart';
import 'package:ocr_app/screens/results/business_card_result.dart';
import 'package:ocr_app/screens/results/qr_result_screen.dart';
import 'package:ocr_app/screens/results/results.dart';
import 'package:ocr_app/screens/results/scanned_result.dart';
import 'package:ocr_app/utils/keyboard_dismiss.dart';

const routeOnboarding = '/routeOnboarding';
const routeHome = '/routeHome';
const routeResult = '/routeResult';
const routeBusinessCardResult = '/routeBusinessCardResult';
const routeScannedResult = '/routeScannedResult';
const routeQrScanner = '/qrScannerScreen';
const routeQrResult = '/routeQrResult';

class Routes {
  static final routes = [
    // GetPage(
    //   name: routeOnboarding,
    //   page: () => const TKDismiss(OnBoardingScreen()),
    //   binding: BindingsBuilder(() {}),
    // ),
    GetPage(
      name: routeHome,
      page: () => const TKDismiss(HomeScreen()),
      binding: BindingsBuilder(() async {
        await Get.find<BusinessCardController>().getLengthOfHistory();
      }),
    ),
    GetPage(
      name: routeResult,
      page: () => TKDismiss(ResultScreen()),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: routeBusinessCardResult,
      page: () => TKDismiss(BusinessCardResultScreen()),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: routeScannedResult,
      page: () => TKDismiss(ScannedResultScreen()),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: routeQrScanner,
      page: () => const TKDismiss(QrScannerScreen()),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: routeQrResult,
      page: () => TKDismiss(QrResultScreen()),
      binding: BindingsBuilder(() {}),
    ),
  ];
}

// Tap Keyboard dismiss
class TKDismiss extends StatelessWidget {
  const TKDismiss(this.child, {Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(child: child);
  }
}
