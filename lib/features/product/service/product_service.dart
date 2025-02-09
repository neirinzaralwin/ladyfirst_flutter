import 'dart:convert';
import 'package:lady_first_flutter/core/constants/api_const.dart';
import 'package:lady_first_flutter/core/network/base_client.dart';
import 'package:lady_first_flutter/features/product/data/models/product.dart';

class ProductService {
  final _client = BaseClient();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _client.get(ApiConst.getProducts);
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
