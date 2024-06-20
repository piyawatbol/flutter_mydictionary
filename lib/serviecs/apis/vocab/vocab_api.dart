import 'package:flutter_mydictionary/models/response_model.dart';

import '../../../config/config.dart';
import '../../https/http_request.dart';

class VocabApi {
  static Future<ResponseModel> getVocab() async {
    ResponseModel response = await HttpRequest.get("${AppEnvironment.baseUrl}/vocab");
    return response;
  }

  static Future<ResponseModel> getVocabOnlyletter(letter) async {
    ResponseModel response =
        await HttpRequest.post("${AppEnvironment.baseUrl}/vocab/$letter");
    return response;
  }

  static Future<ResponseModel> getRandom() async {
    ResponseModel response =
        await HttpRequest.get("${AppEnvironment.baseUrl}/vocab/random");
    return response;
  }

  static Future<ResponseModel> addVocab(body) async {
    ResponseModel response =
        await HttpRequest.post("${AppEnvironment.baseUrl}/vocab", body: body);
    return response;
  }

  static Future<ResponseModel> countVocab(id) async {
    ResponseModel response =
        await HttpRequest.patch("${AppEnvironment.baseUrl}/vocab/$id");
    return response;
  }

  static Future<ResponseModel> deleteVocab(id) async {
    ResponseModel response =
        await HttpRequest.delete("${AppEnvironment.baseUrl}/vocab/$id");
    return response;
  }
}
