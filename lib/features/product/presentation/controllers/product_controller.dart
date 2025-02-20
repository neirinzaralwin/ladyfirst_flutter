import 'package:get/get.dart';
import 'package:lady_first_flutter/features/product/data/models/product.dart';
import 'package:lady_first_flutter/features/product/data/repositories/product_repository.dart';

class ProductController extends GetxController {
  final productRepo = Get.find<ProductRepository>();

  // * Get Products
  RxList<Product> products = <Product>[].obs;
  Rx<GetProductsState> getProductsState = GetProductsState().obs;

  Future<void> getProducts() async {
    try {
      getProductsState(GetProductsLoadingState());
      products.assignAll(await productRepo.getProducts());
      getProductsState(GetProductsSuccessState());
    } catch (e) {
      getProductsState(GetProductsErrorState(e));
    }
  }

  // * Get Product
  Product get currentProduct => currentProductList.first;
  late int currentProductId;

  RxList<Product> currentProductList = <Product>[].obs;
  Rx<GetCurrentProductState> getCurrentProductState =
      GetCurrentProductState().obs;

  Future<void> getProduct() async {
    try {
      getCurrentProductState(GetCurrentProductLoadingState());
      currentProductList.assignAll(
          [await productRepo.getProduct(productId: currentProductId)]);
      getCurrentProductState(GetCurrentProductSuccessState());
    } catch (e) {
      getCurrentProductState(GetCurrentProductErrorState(e));
    }
  }
}

// * Get Products States
class GetProductsState {}

class GetProductsLoadingState extends GetProductsState {}

class GetProductsSuccessState extends GetProductsState {}

class GetProductsErrorState extends GetProductsState {
  final Object error;
  GetProductsErrorState(this.error);
}

// * Get Current Product States
class GetCurrentProductState {}

class GetCurrentProductLoadingState extends GetCurrentProductState {}

class GetCurrentProductSuccessState extends GetCurrentProductState {}

class GetCurrentProductErrorState extends GetCurrentProductState {
  final Object error;
  GetCurrentProductErrorState(this.error);
}
