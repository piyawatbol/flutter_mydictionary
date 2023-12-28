import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../widget/toast/toast_custom.dart';

class HttpRequest {
  static final Dio dio = Dio();

  static Future<Map<String, String>> buildHeaders({
    bool withAccessToken = false,
    bool withContentType = true,
  }) async {
    final Map<String, String> headers = {'Accept': 'application/json'};
    if (withContentType) {
      headers.putIfAbsent('Content-Type', () => 'application/json');
    }
    if (withAccessToken) {}
    return headers;
  }

  static Future post(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await dio.post(
        path,
        data: body,
        options: Options(headers: headers),
      );

      return responseStatus(response);
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.toString());
      return responseStatus(e.response);
    }
  }

  static Future patch(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await dio.patch(
        path,
        data: body,
        options: Options(headers: headers),
      );

      return responseStatus(response);
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.toString());
      return responseStatus(e.response);
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

      return responseStatus(response);
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.toString());
      return responseStatus(e.response);
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
      return responseStatus(response);
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.toString());
      return responseStatus(e.response);
    }
  }

  static Future<Map<String, dynamic>> postImage(
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

      return responseStatus(response);
    } on DioException catch (e) {
      log("error : ${e.message}");
      log(e.toString());
      return responseStatus(e.response);
    }
  }

  static Future<Map<String, dynamic>> responseStatus(response) async {
    print("status => ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> massage = {
          "message": "Success",
          "data": response.data,
        };
        return massage;
      case 201:
        Map<String, dynamic> massage = {
          "message": "Success",
          "data": response.data,
        };
        return massage;
      case 400:
      case 403:
        Map<String, dynamic> massage = {
          "message": "Error",
          "data": response.data
        };
        return massage;
      case 401:
        ToastCustom("${response.data}", Colors.red);
        Map<String, dynamic> massage = {
          "message": "Error",
          "data": response.data
        };
        return massage;
      default:
        throw Exception('Failed to load province');
    }
  }
}
