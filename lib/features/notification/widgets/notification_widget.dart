import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

import 'notification_item.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      title: Text("Order placed").bodyLarge.bold,
      subTitle:
          Text("Your order has been placed successfully").greyColor.bodyMedium,
      isRead: false,
      date: "Last Wednesday at 9:23AM",
    );
  }
}
