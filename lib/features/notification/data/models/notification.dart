// ignore: file_names
import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  const Notification({
    required this.id,
    required this.title,
    required this.type,
    required this.isRead,
    required this.body,
    required this.createdAt,
  });

  final int id;
  final String title;
  final String type;
  final bool isRead;
  final String body;
  final String createdAt;

  Notification copyWith({
    int? id,
    String? title,
    String? type,
    bool? isRead,
    String? body,
    String? createdAt,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      type: json["type"] ?? "",
      isRead: json["isRead"] ?? false,
      body: json["body"] ?? "",
      createdAt: json["createdAt"] ?? "",
    );
  }

  @override
  String toString() {
    return "$id, $title, $type, $isRead, $body, $createdAt, ";
  }

  @override
  List<Object?> get props => [id, title, type, isRead, body, createdAt];
}

/*
{
	"id": 1,
	"title": "Order has been placed",
	"type": "order-status",
	"isRead": false,
	"body": "Your order has been placed successfully",
	"createdAt": "2025-02-20T12:34:56.789Z"
}*/
