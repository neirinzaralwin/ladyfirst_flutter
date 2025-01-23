import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

checkoutBottomBar() {
  return BottomAppBar(
    height: 120.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total').bodyLarge.greyColor.bold,
            Container(
                constraints: BoxConstraints(minWidth: 80),
                child: const Text('\$ 115.0').bodyLarge.bold.orangeColor),
          ],
        ),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => [],
                  child: Text("Proceed"),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
