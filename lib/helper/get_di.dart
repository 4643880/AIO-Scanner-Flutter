import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ocr_app/controller/business_card_controller.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/models/history_model.dart';

Future<void> init() async {
  await Hive.initFlutter();

  Hive.registerAdapter<HistoryModel>(HistoryModelAdapter());
  await Hive.openBox<HistoryModel>(AppTexts.hiveHistory);

  Get.put(BusinessCardController());
}
