import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lady_first_flutter/core/constants/app_const.dart';

class BaseClient {
  static String baseUrl = !AppConst.DEBUGGING_MODE
      ? AppConst.PRODUCTION_URL
      : (Platform.isAndroid ? AppConst.ANDROID_BASE_URL : AppConst.BASE_URL);

  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<http.Response> get(String endpoint) async {
    final headers = await _getHeaders();
    final response =
        await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);
    return _handleResponse(response);
  }

  Future<http.Response> post(String endpoint, {Object? body}) async {
    final headers = await _getHeaders();
    final response = await http.post(Uri.parse('$baseUrl$endpoint'),
        headers: headers, body: jsonEncode(body));
    return _handleResponse(response);
  }

  http.Response _handleResponse(http.Response response) {
    if (response.statusCode == 401) {}
    return response;
  }
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}
