import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfigs {
  final String baseUrl;
  final String token;
  late Dio _dio;

  DioConfigs({required this.baseUrl, required this.token});

  Dio init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "authorization": "Bearer $token",
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(_buildLoggerInterceptor());
    }

    _dio.interceptors.add(_buildAuthInterceptor());

    return _dio;
  }

  PrettyDioLogger _buildLoggerInterceptor() {
    return PrettyDioLogger(
      request: false,
      requestHeader: false,
      requestBody: false,
      responseBody: false,
      responseHeader: false,
      error: false,
      compact: false,
    );
  }

  InterceptorsWrapper _buildAuthInterceptor() {
    return InterceptorsWrapper(
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) async {
        handler.next(error);
      },
    );
  }
}
