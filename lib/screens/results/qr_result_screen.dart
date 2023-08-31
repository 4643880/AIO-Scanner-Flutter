import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ocr_app/config/routes.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/screens/qr%20scanner/qr_scanner.dart';
import 'package:ocr_app/utils/util.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrResultScreen extends StatelessWidget {
  final code = Get.arguments["code"];
  final closeScreenFunc = Get.arguments["closeScreen"];
  QrResultScreen({
    super.key,
    this.closeScreen,
  });

  final Function()? closeScreen;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        closeScreenFunc();
        Get.offAllNamed(routeHome);
        return true;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                closeScreenFunc();
                Get.offAllNamed(routeHome);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "QR Scanner",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Container(
                  child: QrImageView(
                    data: code!,
                    size: 200,
                    version: QrVersions.auto,
                  ),
                ),
                const Text(
                  "Scanned Result",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  code!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: code ?? ""));
                      Utils.showSnackBar(
                        title: "Text Copied",
                        desc: "You have successfully copied the text.",
                        direction: SnackPosition.BOTTOM,
                      );
                    },
                    child: const Text(
                      "Copy",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
