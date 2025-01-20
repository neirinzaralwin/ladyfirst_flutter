import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';

AppBar productDetailAppBar() {
  return AppBar(
    title: Text("Details"),
    leading: IconButton(
      icon: HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft02, color: AppColor.black),
      onPressed: () => AppPages.router.pop(),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: HugeIcon(
              icon: HugeIcons.strokeRoundedFavourite, color: AppColor.black)),
    ],
  );
}
