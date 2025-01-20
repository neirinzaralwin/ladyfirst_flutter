import 'package:flutter/material.dart';

productDetailBottomNavigationBar() {
  return BottomAppBar(
    child: SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    ),
  );
}
