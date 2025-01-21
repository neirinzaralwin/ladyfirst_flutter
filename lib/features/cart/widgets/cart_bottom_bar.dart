import 'package:flutter/material.dart';

cartBottomBar() {
  return BottomAppBar(
    child: SizedBox(
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
  );
}
