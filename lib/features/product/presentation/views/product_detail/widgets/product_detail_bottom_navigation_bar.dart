import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/features/product/presentation/controllers/product_controller.dart';

Widget productDetailBottomNavigationBar(ProductController controller) {
  return BottomAppBar(
    child: Obx(
      () => SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: controller.getCurrentProductState.value
                        is GetCurrentProductSuccessState
                    ? () => AppPages.router.pushNamed(Routes.cart)
                    : null,
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
