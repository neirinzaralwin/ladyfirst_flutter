import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Text("ladyfirst.me"),
    leading: IconButton(
      icon: HugeIcon(
          icon: HugeIcons.strokeRoundedSearch01, color: AppColor.black),
      onPressed: () => AppPages.router.pushNamed(Routes.search),
    ),
    actions: [
      IconButton(
        onPressed: () => AppPages.router.pushNamed(Routes.notification),
        icon: HugeIcon(
            icon: HugeIcons.strokeRoundedNotification01, color: AppColor.black),
      ),
      IconButton(
        onPressed: () => AppPages.router.pushNamed(Routes.login),
        icon: HugeIcon(
            icon: HugeIcons.strokeRoundedShoppingBag01, color: AppColor.black),
      ),
    ],
  );
}
