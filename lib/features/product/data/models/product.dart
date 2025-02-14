import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.productSlug,
    required this.description,
    required this.originalPrice,
    required this.secondHandPrice,
    required this.condition,
    required this.size,
    required this.color,
    required this.authenticityDocument,
    required this.image,
    required this.createdAt,
    required this.seller,
    required this.category,
    required this.brand,
  });

  final int id;
  final String title;
  final String productSlug;
  final String description;
  final String originalPrice;
  final String secondHandPrice;
  final String condition;
  final String size;
  final String color;
  final String authenticityDocument;
  final String image;
  final String createdAt;
  final num seller;
  final num category;
  final num brand;

  Product copyWith({
    int? id,
    String? title,
    String? productSlug,
    String? description,
    String? originalPrice,
    String? secondHandPrice,
    String? condition,
    String? size,
    String? color,
    String? authenticityDocument,
    String? image,
    String? createdAt,
    num? seller,
    num? category,
    num? brand,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      productSlug: productSlug ?? this.productSlug,
      description: description ?? this.description,
      originalPrice: originalPrice ?? this.originalPrice,
      secondHandPrice: secondHandPrice ?? this.secondHandPrice,
      condition: condition ?? this.condition,
      size: size ?? this.size,
      color: color ?? this.color,
      authenticityDocument: authenticityDocument ?? this.authenticityDocument,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      seller: seller ?? this.seller,
      category: category ?? this.category,
      brand: brand ?? this.brand,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      productSlug: json["product_slug"] ?? "",
      description: json["description"] ?? "",
      originalPrice: json["original_price"] ?? "",
      secondHandPrice: json["second_hand_price"] ?? "",
      condition: json["condition"] ?? "",
      size: json["size"] ?? "",
      color: json["color"] ?? "",
      authenticityDocument: json["authenticity_document"] ?? "",
      image: json["image"] ?? "",
      createdAt: json["created_at"] ?? "",
      seller: json["seller"] ?? 0,
      category: json["category"] ?? 0,
      brand: json["brand"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "product_slug": productSlug,
        "description": description,
        "original_price": originalPrice,
        "second_hand_price": secondHandPrice,
        "condition": condition,
        "size": size,
        "color": color,
        "authenticity_document": authenticityDocument,
        "image": image,
        "created_at": createdAt,
        "seller": seller,
        "category": category,
        "brand": brand,
      };

  @override
  String toString() {
    return "$id, $title, $productSlug, $description, $originalPrice, $secondHandPrice, $condition, $size, $color, $authenticityDocument, $image, $createdAt, $seller, $category, $brand, ";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        productSlug,
        description,
        originalPrice,
        secondHandPrice,
        condition,
        size,
        color,
        authenticityDocument,
        image,
        createdAt,
        seller,
        category,
        brand,
      ];
}

/*
{
	"id": 1,
	"title": "shirt",
	"product_slug": "shirt",
	"description": "Louis Vuitton White Shirt – Pre-Loved, Excellent Condition\r\n\r\nElevate your wardrobe with this classic Louis Vuitton white shirt, crafted with premium fabric and timeless style. This pre-owned shirt is in excellent condition with minimal signs of wear, offering the luxury and sophistication of LV at a fraction of the original price.\r\n\r\nWhether you're dressing up for a formal event or keeping it casual, this Louis Vuitton shirt offers versatile styling possibilities. Grab this iconic piece before it’s gone!",
	"original_price": "450.00",
	"second_hand_price": "100.00",
	"condition": "gently_used",
	"size": "M",
	"color": "white",
	"authenticity_document": null,
	"image": "https://ladyfirst.pythonanywhere.com/media/products/Screenshot_2025-02-14_at_12_z1U5jLH.29.18AM.png",
	"created_at": "2025-02-13T17:47:51.281836Z",
	"seller": 1,
	"category": 1,
	"brand": 1
}*/
