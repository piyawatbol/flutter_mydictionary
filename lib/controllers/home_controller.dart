import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:get/get.dart';

import 'oxford_controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    Get.put(OxfordController());
    Get.put(VocabController());
    super.onInit();
  }
}
