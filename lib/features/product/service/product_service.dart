import 'dart:convert';
import 'package:lady_first_flutter/core/constants/api_const.dart';
import 'package:lady_first_flutter/core/network/base_client.dart';
import 'package:lady_first_flutter/features/product/data/models/product.dart';

class ProductService {
  final _client = BaseClient();
  final bool useMockData = true;

  Future<List<Product>> fetchProducts() async {
    if (useMockData) {
      return _getMockProducts();
    }

    try {
      final response = await _client.get(ApiConst.getProducts);
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  List<Product> _getMockProducts() {
    return [
      Product(
        id: 1,
        title: "Gucci Jacket",
        description: "Limited Edition Gucci Jacket",
        price: "1200.00",
        originalPrice: "1500.00",
        secondHandPrice: "1200.00",
        category: "jacket",
        condition: "gently_used",
        size: "M",
        authenticityDocument: null,
        image: "https://picsum.photos/200/300",
        createdAt: "2024-02-06T19:16:28.232510Z",
        seller: 1,
      ),
      Product(
        id: 2,
        title: "Louis Vuitton Bag",
        description: "Authentic LV Shoulder Bag",
        price: "2500.00",
        originalPrice: "3000.00",
        secondHandPrice: "2500.00",
        category: "bags",
        condition: "like_new",
        size: "One Size",
        authenticityDocument: "yes",
        image: "https://picsum.photos/200/301",
        createdAt: "2024-02-06T20:16:28.232510Z",
        seller: 2,
      ),
    ];
  }
}
