import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://my-json-server.typicode.com/',
      receiveDataWhenStatusError: true,
    ));
  }
}
