import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Text("ladyfirst.me"),
    leading: IconButton(
      icon: HugeIcon(
          icon: HugeIcons.strokeRoundedSearch01, color: AppColor.black),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: HugeIcon(
            icon: HugeIcons.strokeRoundedShoppingBag01, color: AppColor.black),
      ),
    ],
  );
}
