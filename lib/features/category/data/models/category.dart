import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.title,
    required this.categorySlug,
    required this.url,
  });

  final int id;
  final String title;
  final String categorySlug;
  final String url;

  Category copyWith({
    int? id,
    String? title,
    String? categorySlug,
    String? url,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      categorySlug: categorySlug ?? this.categorySlug,
      url: url ?? this.url,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      categorySlug: json["category_slug"] ?? "",
      url: json["url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category_slug": categorySlug,
        "url": url,
      };

  @override
  String toString() {
    return "$id, $title, $categorySlug, $url";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        categorySlug,
        url,
      ];
}

/*
{
	"id": 1,
	"title": "shirt",
	"category_slug": "shirt"
  "url": "https://www.example.com/shirt"  
}*/
