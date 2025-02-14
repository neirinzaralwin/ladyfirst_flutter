import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/features/category/data/models/category.dart';
import 'package:lady_first_flutter/features/category/data/repositories/category_repository.dart';
part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());

  final _categoryRepository = CategoryRepository();
  late int productId;

  Future<void> getProduct() async {
    try {
      emit(GetCategoriesLoading());
      final categories = await _categoryRepository.getCategories();
      emit(GetCategoriesLoaded(categories));
    } catch (e) {
      debugPrint("Failed to fetch categories : $e");
      emit(GetCategoriesError(e.toString()));
    }
  }
}
