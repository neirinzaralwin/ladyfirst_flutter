import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/features/notification/controllers/notification_controller.dart';
import 'package:lady_first_flutter/features/notification/presentation/widgets/notification_item.dart';
import 'widgets/notification_loading_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationController = Get.find<NotificationController>();

  @override
  void initState() {
    notificationController.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: RefreshIndicator.adaptive(
        onRefresh: _refreshNotifications,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Obx(() {
            final state = notificationController.getNotificationsState.value;

            if (state is GetNotificationsErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(state.error.toString()).bodyMedium,
                    ),
                    TextButton.icon(
                      onPressed:
                          () => notificationController.getNotifications(),
                      label: const Text('Retry'),
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              );
            }

            if (state is GetNotificationsSuccessState) {
              final notifications = notificationController.notifications;

              if (notifications.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('No notifications available'),
                  ),
                );
              }

              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final notification = notifications[index];
                      return NotificationItem(
                        title: Text(notification.title).bodyLarge.bold,
                        subTitle: Text(notification.body).greyColor.bodyMedium,
                        isRead: notification.isRead,
                        date: notification.createdAt,
                      );
                    }, childCount: notifications.length),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 30.0)),
                ],
              );
            }

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [NotificationLoadingWidget()],
            );
          }),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Notification"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => AppPages.router.pop(),
      ),
    );
  }

  Future<void> _refreshNotifications() async {}
}
