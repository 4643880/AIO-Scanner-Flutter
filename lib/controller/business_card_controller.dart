import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessCardController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RxString allText = "".obs;
}
