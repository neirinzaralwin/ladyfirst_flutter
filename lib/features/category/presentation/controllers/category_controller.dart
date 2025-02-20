import 'package:get/get.dart';
import 'package:lady_first_flutter/features/category/data/models/category.dart';
import 'package:lady_first_flutter/features/category/data/repositories/category_repository.dart';

class CategoryController extends GetxController {
  final categoryRepo = Get.find<CategoryRepository>();

  // * Get Categories
  RxList<Category> categories = <Category>[].obs;
  Rx<GetCategoriesState> getCategoriesState = GetCategoriesState().obs;

  Future<void> getCategories() async {
    try {
      getCategoriesState(GetCategoriesLoadingState());
      categories.assignAll(await categoryRepo.getCategories());
      getCategoriesState(GetCategoriesSuccessState());
    } catch (e) {
      getCategoriesState(GetCategoriesErrorState(e));
    }
  }
}

// * Get Categories States
class GetCategoriesState {}

class GetCategoriesLoadingState extends GetCategoriesState {}

class GetCategoriesSuccessState extends GetCategoriesState {}

class GetCategoriesErrorState extends GetCategoriesState {
  final Object error;
  GetCategoriesErrorState(this.error);
}
