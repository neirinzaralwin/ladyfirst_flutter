import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';

cartBottomBar() {
  return BottomAppBar(
    child: SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => AppPages.router.pushNamed(Routes.checkout),
              child: Text("Proceed"),
            ),
          ),
        ],
      ),
    ),
  );
}
