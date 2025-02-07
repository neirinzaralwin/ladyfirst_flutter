import 'package:lady_first_flutter/features/product/data/models/product.dart';
import 'package:lady_first_flutter/features/product/service/product_service.dart';

class ProductRepository {
  final ProductService _productService = ProductService();

  Future<List<Product>> getProducts() async {
    try {
      return await _productService.fetchProducts();
    } catch (e) {
      throw Exception('Repository Error: Failed to get products - $e');
    }
  }
}
