import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.secondHandPrice,
    required this.category,
    required this.condition,
    required this.size,
    required this.authenticityDocument,
    required this.image,
    required this.createdAt,
    required this.seller,
  });

  final int id;
  final String title;
  final String description;
  final String price;
  final String originalPrice;
  final String secondHandPrice;
  final String category;
  final String condition;
  final String size;
  final String authenticityDocument;
  final String image;
  final String createdAt;
  final num seller;

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? price,
    String? originalPrice,
    String? secondHandPrice,
    String? category,
    String? condition,
    String? size,
    String? authenticityDocument,
    String? image,
    String? createdAt,
    num? seller,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      secondHandPrice: secondHandPrice ?? this.secondHandPrice,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      size: size ?? this.size,
      authenticityDocument: authenticityDocument ?? this.authenticityDocument,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      seller: seller ?? this.seller,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? "Untitled",
      description: json["description"] ?? "No description",
      price: json["price"] ?? "0",
      originalPrice: json["original_price"] ?? "0",
      secondHandPrice: json["second_hand_price"] ?? "0",
      category: json["category"] ?? "None",
      condition: json["condition"] ?? "Unknown",
      size: json["size"] ?? "N/A",
      authenticityDocument: json["authenticity_document"] ?? "",
      image: json["image"] ?? "",
      createdAt: json["created_at"] ?? "",
      seller: json["seller"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "original_price": originalPrice,
        "second_hand_price": secondHandPrice,
        "category": category,
        "condition": condition,
        "size": size,
        "authenticity_document": authenticityDocument,
        "image": image,
        "created_at": createdAt,
        "seller": seller,
      };

  @override
  String toString() {
    return "$id, $title, $description, $price, $originalPrice, $secondHandPrice, $category, $condition, $size, $authenticityDocument, $image, $createdAt, $seller, ";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        originalPrice,
        secondHandPrice,
        category,
        condition,
        size,
        authenticityDocument,
        image,
        createdAt,
        seller,
      ];
}

/*
[
	{
		"id": 1,
		"title": "product1",
		"description": "this is content for product 1",
		"price": "350.00",
		"original_price": "650.00",
		"second_hand_price": "350.00",
		"category": "jacket",
		"condition": "gently_used",
		"size": "M",
		"authenticity_document": null,
		"image": "https://ladyfirst.pythonanywhere.com/media/products/Screenshot_2025-02-07_at_2.16.16AM.png",
		"created_at": "2025-02-06T19:16:28.232510Z",
		"seller": 1
	}
]*/
