import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'widgets/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: RefreshIndicator.adaptive(
        onRefresh: _refreshNotifications,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const NotificationWidget();
                  },
                  childCount: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30.0),
              ),
            ],
          ),
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
