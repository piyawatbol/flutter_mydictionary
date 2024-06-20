import '../../../config/config.dart';
import '../../../models/response_model.dart';
import '../../https/http_request.dart';

class OxfordApi {
  static Future<ResponseModel> getOxford() async {
    ResponseModel response =
        await HttpRequest.get("${AppEnvironment.baseUrl}/oxford");
    return response;
  }

  static Future<ResponseModel> addOxford(body) async {
    ResponseModel response = await HttpRequest.post(
      "${AppEnvironment.baseUrl}/oxford",
      body: body,
    );
    return response;
  }
}
