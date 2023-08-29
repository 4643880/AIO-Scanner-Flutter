import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ocr_app/config/routes.dart';
import 'package:ocr_app/utils/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) {
        final easyLoading = EasyLoading.init();
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            ScreenUtil.init(
              context,
              designSize: const Size(360, 900),
            );
            child = easyLoading(context, child);
            Utils.setEasyLoading();
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.85),
              child: child,
            );
          },
          getPages: Routes.routes,
          initialRoute: routeHome,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 300),
        );
      }),
    );
  }
}
