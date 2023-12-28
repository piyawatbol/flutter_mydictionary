import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/models/vocab_model.dart';
import 'package:flutter_mydictionary/serviecs/apis/vocab/vocab_api.dart';
import 'package:flutter_mydictionary/widget/toast/toast_custom.dart';
import 'package:get/get.dart';

class VocabController extends GetxController {
  List<VocabModel> vocabList = [];
  bool statusLoading = false;
  TextEditingController word = TextEditingController();
  TextEditingController mean = TextEditingController();

  @override
  void onInit() {
    getVocab();
    super.onInit();
  }

  getVocab() async {
    final response = await VocabApi.getVocab();
    if (response['message'] == 'Success') {
      vocabList.clear();
      vocabList.addAll(response['data']
          .map<VocabModel>((values) => VocabModel.fromJson(values)));
      update();
    }
  }

  addVocab() async {
    statusLoading = true;
    update();
    Map<String, dynamic> body = {'word': word.text, 'mean': mean.text};
    final response = await VocabApi.addVocab(body);
    if (response['message'] == 'Success') {
      word.clear();
      mean.clear();
      ToastCustom("Success", Colors.green);
      getVocab();
      statusLoading = false;
      update();
      Get.back();
    }
  }

  countVocab(id) async {
    statusLoading = true;
    update();
    final response = await VocabApi.countVocab(id);
    if (response['message'] == 'Success') {
      ToastCustom("Success", Colors.green);
      getVocab();
      statusLoading = false;
      update();
      Get.back();
    }
  }
}
