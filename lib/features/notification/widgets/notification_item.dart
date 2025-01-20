import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class NotificationItem extends StatelessWidget {
  final Widget title;
  final Widget? subTitle;
  final String date;
  final bool? isRead;

  const NotificationItem({
    required this.title,
    this.subTitle,
    required this.date,
    this.isRead = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isRead!)
          const Positioned(
              top: 10.0,
              child: Icon(
                Icons.circle,
                color: AppColor.orangeColor,
                size: 10.0,
              )),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColor.mildGray,
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    if (subTitle != null) ...[
                      const SizedBox(height: 5.0),
                      subTitle!,
                    ],
                    const SizedBox(height: 5.0),
                    Text(date).bodySmall.lightGrey,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
