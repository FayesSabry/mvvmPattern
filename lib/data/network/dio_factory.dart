import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/app/app_prefs.dart';
import 'package:mvvm/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppPrferences _appPrferences;
  DioFactory(this._appPrferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();
    final language = await _appPrferences.getAppLanguage();
    final int timeout = 60;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Send token here',
      'Default-Language': language,
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      connectTimeout: Duration(seconds: timeout),
      receiveTimeout: Duration(seconds: timeout),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ),
      );
    }
    return dio;
  }
}
