import 'package:lady_first_flutter/features/category/data/models/category.dart';
import 'package:lady_first_flutter/features/category/service/category_service.dart';

class CategoryRepository {
  // ignore: unused_field
  final CategoryService _categoryService = CategoryService();

  Future<List<Category>> getCategories() async {
    // Mock data
    List<Category> mockCategories = [
      Category(
          id: 1,
          title: 'Bags & Wallets',
          categorySlug: 'bags',
          url: 'assets/icons/bag_and_wallet.svg'),
      Category(
          id: 2,
          title: 'Footwears',
          categorySlug: 'footwears',
          url: 'assets/icons/foot_wear.svg'),
      Category(
          id: 3,
          title: 'Tops',
          categorySlug: 'tops',
          url: 'assets/icons/tops.svg'),
      Category(
          id: 4,
          title: 'Dresses',
          categorySlug: 'dresses',
          url: 'assets/icons/dresses_and_sets.svg'),
      Category(
          id: 5,
          title: 'Jewelry',
          categorySlug: 'jewelry',
          url: 'assets/icons/jewelry_and_organizers.svg'),
    ];
    return mockCategories;
  }
}
