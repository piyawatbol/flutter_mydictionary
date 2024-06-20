import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/serviecs/apis/oxford/oxford_api.dart';
import 'package:get/get.dart';

import '../models/oxford_model.dart';
import '../widget/toast/toast_custom.dart';

class OxfordController extends GetxController {
  TextEditingController word = TextEditingController();
  TextEditingController mean = TextEditingController();
  List<OxfordModel> oxfordList = [];
  bool hideMean = true;

  @override
  void onInit() {
    getOxford();
    super.onInit();
  }

  getOxford() async {
    oxfordList.clear();
    final response = await OxfordApi.getOxford();
    if (response.isSucces) {
      oxfordList.addAll(response.data
          .map<OxfordModel>((values) => OxfordModel.fromJson(values)));
      update();
    }
  }

  addOxford() async {
    Map<String, dynamic> body = {
      "word": word.text.toLowerCase(),
      "mean": mean.text,
    };
    final response = await OxfordApi.addOxford(body);
    if (response.isSucces) {
      word.clear();
      mean.clear();
      ToastCustom("${response.data['data']}", Colors.green);
      getOxford();
      Get.back();
    }
  }
}
