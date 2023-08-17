import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_app/screens/home/home_screen.dart';
import 'package:ocr_app/screens/onboarding/onboarding_screen.dart';
import 'package:ocr_app/utils/keyboard_dismiss.dart';

const routeOnboarding = '/routeOnboarding';
const routeHome = '/routeHome';

class Routes {
  static final routes = [
    GetPage(
      name: routeOnboarding,
      page: () => const TKDismiss(OnBoardingScreen()),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: routeHome,
      page: () => const TKDismiss(HomeScreen()),
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
