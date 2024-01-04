import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/models/vocab_model.dart';
import 'package:flutter_mydictionary/screen/home/find/find_detail_screen.dart';
import 'package:flutter_mydictionary/serviecs/apis/vocab/vocab_api.dart';
import 'package:flutter_mydictionary/widget/toast/toast_custom.dart';
import 'package:get/get.dart';

class VocabController extends GetxController {
  List<VocabModel> vocabList = [];
  List<VocabModel> findList = [];
  VocabModel? random;
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

  getVocabOnlyletter(letter) async {
    final response = await VocabApi.getVocabOnlyletter(letter);
    if (response['message'] == 'Success') {
      findList.clear();
      findList.addAll(response['data']
          .map<VocabModel>((values) => VocabModel.fromJson(values)));
      update();
      Get.to(() => FindDetailScreen(vocabList: findList));
    }
  }

  getRandom() async {
    final response = await VocabApi.getRandom();
    if (response['message'] == 'Success') {
      random = VocabModel.fromJson(response['data']);
      update();
    }
  }

  addVocab() async {
    statusLoading = true;
    update();
    Map<String, dynamic> body = {'word': word.text, 'mean': mean.text};
    final response = await VocabApi.addVocab(body);
    if (response['message'] == 'Success') {
      ToastCustom("${response['data']['data']}", Colors.green);
      getVocab();
      statusLoading = false;
      word.clear();
      mean.clear();
      update();
      Get.back();
    }
  }

  countVocab(id) async {
    statusLoading = true;
    update();
    final response = await VocabApi.countVocab(id);
    if (response['message'] == 'Success') {
      ToastCustom("${response['data']['data']}", Colors.green);
      getVocab();
      statusLoading = false;
      update();
      Get.back();
    }
  }

  deleteVocab(id) async {
    statusLoading = false;
    update();
    final response = await VocabApi.deleteVocab(id);
    if (response['message'] == 'Success') {
      ToastCustom("${response['data']['data']}", Colors.green);
      statusLoading = false;
      update();
      getVocab();
      Get.back();
      Get.back();
    }
  }
}
