import 'package:lady_first_flutter/core/network/api_client.dart';
import 'package:lady_first_flutter/features/notification/data/models/notification.dart';

class NotificationRepository {
  final ApiClient apiClient;

  NotificationRepository({required this.apiClient});

  Future<List<Notification>> getNotifications() async {
    final sampleNotification = Notification(
      id: 1,
      title: "Order placed",
      type: "order-status",
      isRead: false,
      body: "Your order has been placed successfully",
      createdAt: "Last Wednesday at 9:23AM",
    );
    return Future.delayed(
      const Duration(seconds: 2),
      () => [sampleNotification],
    );
  }
}
