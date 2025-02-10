import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/features/product/data/models/product.dart';
import 'package:lady_first_flutter/features/product/data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_home_products_state.dart';

class GetHomeProductsCubit extends Cubit<GetHomeProductsState> {
  final ProductRepository _productRepository = ProductRepository();

  GetHomeProductsCubit() : super(GetHomeProductsInitial());

  Future<void> getProducts() async {
    try {
      emit(GetHomeProductsLoading());
      final products = await _productRepository.getProducts();

      if (products.isEmpty) {
        emit(GetHomeProductsEmpty());
        return;
      }

      emit(GetHomeProductsLoaded(products));
    } catch (e) {
      debugPrint("Failed to fetch products : $e");
      emit(GetHomeProductsError(e.toString()));
    }
  }

  Future<void> refreshProducts() async {
    try {
      await getProducts();
    } catch (e) {
      emit(GetHomeProductsError(e.toString()));
    }
  }
}
