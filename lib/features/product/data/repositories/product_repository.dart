import 'package:lady_first_flutter/core/constants/api_const.dart';
import 'package:lady_first_flutter/core/network/api_client.dart';
import 'package:lady_first_flutter/features/product/data/models/product.dart';

class ProductRepository {
  final ApiClient apiClient;
  ProductRepository({required this.apiClient});

  Future<List<Product>> getProducts() async {
    final response =
        await apiClient.getData(ApiConst.getProducts).onError((error, stack) {
      throw Exception('Failed to fetch products: $error');
    });
    if (response.statusCode == 200) {
      return (response.body as List)
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<Product> getProduct({required int productId}) async {
    final response = await apiClient
        .getData('${ApiConst.getProducts}/$productId')
        .onError((error, stack) {
      throw Exception('Failed to fetch product: $error');
    });
    if (response.statusCode == 200) {
      return Product.fromJson(response.body);
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
