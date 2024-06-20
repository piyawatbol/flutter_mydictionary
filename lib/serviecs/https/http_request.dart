import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/response_model.dart';

class HttpRequest {
  static final Dio dio = Dio();
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    return token;
  }

  static Future<Map<String, String>> buildHeaders({
    bool withAccessToken = false,
    bool withContentType = true,
  }) async {
    final Map<String, String> headers = {'Accept': 'application/json'};
    if (withContentType) {
      headers.putIfAbsent('Content-Type', () => 'application/json');
    }
    if (withAccessToken) {
      String? token = await getToken();
      if (token != null) {
        headers.putIfAbsent('Authorization', () => 'Bearer ' + token);
      }
    }
    return headers;
  }

  static Future post(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      Response response = await dio.post(
        path,
        data: body,
        options: Options(headers: headers),
      );

      return responseSuccess(response, path);
    } on DioException catch (e) {
      log(e.response!.data.toString());
      return responseError(e, path);
    }
  }

  static Future get(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await dio.get(
        path,
        queryParameters: body,
        options: Options(headers: headers),
      );
      return responseSuccess(response, path);
    } on DioException catch (e) {
      log(e.toString());
      return responseError(e, path);
    }
  }

  static Future patch(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      Response response = await dio.patch(
        path,
        data: body,
        options: Options(headers: headers),
      );

      return responseSuccess(response, path);
    } on DioException catch (e) {
      log(e.response!.data.toString());
      return responseError(e, path);
    }
  }

  static Future delete(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await dio.delete(
        path,
        data: body,
        options: Options(headers: headers),
      );
      return responseSuccess(response, path);
    } on DioException catch (e) {
      log(e.toString());
      return responseError(e, path);
    }
  }

  static Future postImage(
    String path, {
    dynamic body,
    bool withAccessToken = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await dio.post(
        path,
        data: body,
        options: Options(headers: headers),
      );
      return responseSuccess(response, path);
    } on DioException catch (e) {
      log("error : ${e.message}");
      log(e.toString());
      return responseError(e, path);
    }
  }

  static ResponseModel responseSuccess(Response response, path) {
    log("status => ${response.statusCode} ${path}");
    switch (response.statusCode) {
      case 200:
        return ResponseModel(isSucces: true, data: response.data);
      case 201:
        return ResponseModel(isSucces: true, data: response.data);
      default:
        throw Exception('Failed to load province');
    }
  }

  static ResponseModel responseError(DioException e, path) {
    log("status => ${e.response!.statusCode} ${path}");
    log("error :${e.response!.data}");
    switch (e.response!.statusCode) {
      case 400:
        return ResponseModel(isSucces: false, data: e.response!.data);
      case 401:
        return ResponseModel(isSucces: false, data: e.response!.data);
      case 403:
        return ResponseModel(isSucces: false, data: e.response!.data);
      case 404:
        return ResponseModel(isSucces: false, data: e.response!.data);
      case 500:
        return ResponseModel(isSucces: false, data: e.response!.data);
      default:
        throw Exception('Failed to load province');
    }
  }
}
