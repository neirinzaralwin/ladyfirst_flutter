import 'dart:convert';
import 'package:lady_first_flutter/core/constants/api_const.dart';
import 'package:lady_first_flutter/core/network/base_client.dart';
import 'package:lady_first_flutter/features/category/data/models/category.dart';

class CategoryService {
  final _client = BaseClient();

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await _client.get(ApiConst.getCategories);
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Category.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
