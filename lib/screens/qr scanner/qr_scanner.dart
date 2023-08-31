import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ocr_app/config/routes.dart';
import 'package:ocr_app/helper/app_colors.dart';
import 'package:ocr_app/helper/hive_boxes.dart';
import 'package:ocr_app/models/history_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

const bgColor = Color(0xfffafafa);

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  MobileScannerController controller = MobileScannerController();
  bool isScanCompleted = false;
  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR code in the area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Scanning will be start Automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: controller,
                      allowDuplicates: true,
                      onDetect: (barcode, args) async {
                        if (!isScanCompleted) {
                          if (await Vibration.hasCustomVibrationsSupport() ==
                              true) {
                            Vibration.vibrate(duration: 1000);
                          } else {
                            Vibration.vibrate();
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            Vibration.vibrate();
                          }
                          final String code = barcode.rawValue ?? "";
                          final data = HistoryModel(
                            text: code,
                            dateTime: DateTime.now().toString(),
                            type: "qr",
                          );
                          final box = Boxes.getHistory();
                          box.add(data);
                          Get.toNamed(
                            routeQrResult,
                            arguments: {
                              "code": code,
                              "closeScreen": closeScreen
                            },
                          );
                          isScanCompleted = true;
                        }
                      },
                    ),
                    QRView(
                      key: const Key("1"),
                      overlay: QrScannerOverlayShape(
                        borderColor: AppColors.primary,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        overlayColor: bgColor,
                        cutOutSize: 320,
                      ),
                      onQRViewCreated: (p0) {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Developed By Greelogix",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
