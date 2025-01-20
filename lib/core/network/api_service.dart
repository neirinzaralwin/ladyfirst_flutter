import 'package:dio/dio.dart';

class ApiService {
  static Dio? _dio;

  static void init(Dio dioInstance) {
    _dio = dioInstance;
  }

  static Dio get dio {
    return _dio ?? Dio();
  }

  static void dispose() {
    _dio?.close();
    _dio = null;
  }
}
