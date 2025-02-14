import 'package:lady_first_flutter/features/category/data/models/category.dart';
import 'package:lady_first_flutter/features/category/service/category_service.dart';

class CategoryRepository {
  final CategoryService _categoryService = CategoryService();

  Future<List<Category>> getCategories() async {
    return await _categoryService.fetchCategories();
  }
}
