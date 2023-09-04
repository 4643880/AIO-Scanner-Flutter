import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_app/helper/hive_boxes.dart';

class BusinessCardController extends GetxController {
  RxInt historyLength = 0.obs;
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RxString allText = "".obs;

  Future<void> getLengthOfHistory() async {
    historyLength.value = Boxes.getHistory().values.toList().length;
    update();
  }
}
