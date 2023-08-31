import 'package:hive_flutter/hive_flutter.dart';
import 'package:ocr_app/helper/app_texts.dart';
import 'package:ocr_app/models/history_model.dart';

class Boxes {
  static Box<HistoryModel> getHistory() =>
      Hive.box<HistoryModel>(AppTexts.hiveHistory);
}
