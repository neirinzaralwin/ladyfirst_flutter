import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'get_home_products_state.dart';

class GetHomeProductsCubit extends Cubit<GetHomeProductsState> {
  GetHomeProductsCubit() : super(GetHomeProductsInitial());

  Future<void> getProducts() async {
    try {
      emit(GetHomeProductsLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(GetHomeProductsLoaded());
    } catch (e) {
      debugPrint("Error in getting products : $e");
      emit(GetHomeProductsError("Error in getting products"));
    }
  }
}
