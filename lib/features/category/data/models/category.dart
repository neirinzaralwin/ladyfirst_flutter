import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.title,
    required this.categorySlug,
  });

  final int id;
  final String title;
  final String categorySlug;

  Category copyWith({
    int? id,
    String? title,
    String? categorySlug,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      categorySlug: categorySlug ?? this.categorySlug,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      categorySlug: json["category_slug"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category_slug": categorySlug,
      };

  @override
  String toString() {
    return "$id, $title, $categorySlug, ";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        categorySlug,
      ];
}

/*
{
	"id": 1,
	"title": "shirt",
	"category_slug": "shirt"
}*/
