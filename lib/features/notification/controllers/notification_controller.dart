import 'package:get/get.dart';
import 'package:lady_first_flutter/features/notification/data/models/notification.dart';
import 'package:lady_first_flutter/features/notification/data/repositories/notification_repository.dart';

class NotificationController extends GetxController {
  final notificationRepo = Get.find<NotificationRepository>();

  // * Get Notifications
  Rx<GetNotifications> getNotificationsState = GetNotifications().obs;
  RxList<Notification> notifications = <Notification>[].obs;

  Future<void> getNotifications() async {
    try {
      getNotificationsState(GetNotificationsLoadingState());
      notifications.assignAll(await notificationRepo.getNotifications());
      getNotificationsState(GetNotificationsSuccessState());
    } catch (e) {
      getNotificationsState(GetNotificationsErrorState(e));
    }
  }
}

class GetNotifications {}

class GetNotificationsLoadingState extends GetNotifications {}

class GetNotificationsSuccessState extends GetNotifications {}

class GetNotificationsErrorState extends GetNotifications {
  final Object error;
  GetNotificationsErrorState(this.error);
}
