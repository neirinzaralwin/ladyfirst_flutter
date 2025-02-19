import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late Map<String, String> _formHeader;
  SharedPreferences sharedPreferences;
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);

    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
      "HttpHeaders.contentTypeHeader": "application/json",
      "Accept": "application/json"
    };

    // _formHeader = {'Authorization': 'Bearer $token', "Accept": "application/json"};
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(
    String uri,
    dynamic body,
  ) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postFormData(
    String uri,
    dynamic body,
  ) async {
    try {
      Response response =
          await post(uri, body, headers: {"Accept": "application/json"});
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postFormDataWithHeader(
    String uri,
    dynamic body,
  ) async {
    try {
      Response response = await post(uri, body, headers: _formHeader);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(
    String uri,
  ) async {
    try {
      Response response = await delete(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<List<T>> getList<T>(
      String uri, T Function(Map<String, dynamic>) fromJson) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      if (response.statusCode == 200) {
        if (response.body is List) {
          return (response.body as List)
              .map((item) => fromJson(item as Map<String, dynamic>))
              .toList();
        } else if (response.body is String) {
          final List<dynamic> decoded = json.decode(response.body);
          return decoded
              .map((item) => fromJson(item as Map<String, dynamic>))
              .toList();
        }
      }
      throw Exception('Failed to fetch list data');
    } catch (e) {
      throw Exception('Error fetching list: ${e.toString()}');
    }
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      "HttpHeaders.contentTypeHeader": "application/json",
      "Accept": "application/json"
    };
  }
}
