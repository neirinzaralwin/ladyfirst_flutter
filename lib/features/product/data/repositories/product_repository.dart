import 'package:lady_first_flutter/features/product/data/models/product.dart';
import 'package:lady_first_flutter/features/product/service/product_service.dart';

class ProductRepository {
  final ProductService _productService = ProductService();

  Future<List<Product>> getProducts() async {
    return await _productService.fetchProducts();
  }

  Future<Product> getProduct({required int productId}) async {
    return await _productService.fetchProduct(productId: productId);
  }
}
