import '../../../config/config.dart';
import '../../https/http_request.dart';

class VocabApi {
  static Future getVocab() async {
    final response = await HttpRequest.get("${AppEnvironment.baseUrl}");
    return response;
  }

  static Future getVocabOnlyletter(letter) async {
    final response =
        await HttpRequest.post("${AppEnvironment.baseUrl}/$letter");
    return response;
  }

  static Future getRandom() async {
    final response = await HttpRequest.get("${AppEnvironment.baseUrl}/random");
    return response;
  }

  static Future addVocab(body) async {
    final response =
        await HttpRequest.post("${AppEnvironment.baseUrl}", body: body);
    return response;
  }

  static Future countVocab(id) async {
    final response = await HttpRequest.patch("${AppEnvironment.baseUrl}/$id");
    return response;
  }

  static Future deleteVocab(id) async {
    final response = await HttpRequest.delete("${AppEnvironment.baseUrl}/$id");
    return response;
  }
}
