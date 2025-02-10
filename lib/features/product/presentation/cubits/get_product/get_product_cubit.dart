import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/features/product/data/models/product.dart';
import 'package:lady_first_flutter/features/product/data/repositories/product_repository.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit() : super(GetProductInitial());

  final _productRepository = ProductRepository();
  late int productId;

  Future<void> getProduct() async {
    try {
      emit(GetProductLoading());
      final products =
          await _productRepository.getProduct(productId: productId);
      emit(GetProductLoaded(products));
    } catch (e) {
      debugPrint("Failed to fetch product : $e");
      emit(GetProductError(e.toString()));
    }
  }
}
