import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/features/product/presentation/controllers/product_controller.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailImageView extends GetView<ProductController> {
  const ProductDetailImageView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenDimension.getWidth(context);
    final currentIndex = 0.obs;

    return Obx(() {
      final state = controller.getCurrentProductState.value;

      if (state is GetCurrentProductLoadingState) {
        return _buildLoadingWidget(screenWidth);
      }

      if (state is GetCurrentProductSuccessState) {
        final image = controller.currentProduct.image;

        return Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenWidth,
              decoration: const BoxDecoration(color: AppColor.black),
              child: PageView.builder(
                itemCount: 1,
                onPageChanged: (index) => currentIndex.value = index,
                itemBuilder: (context, index) {
                  return Image.network(
                    image,
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            Positioned(
              left: 20.0,
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 3.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Obx(() => Text(
                      "${currentIndex.value + 1}/1",
                    ).bodySmall.white),
              ),
            ),
          ],
        );
      }

      if (state is GetCurrentProductErrorState) {
        return _buildErrorWidget(state.error.toString(), screenWidth);
      }

      return SizedBox(
        width: screenWidth,
        height: screenWidth,
      );
    });
  }

  Widget _buildLoadingWidget(double screenWidth) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: screenWidth,
        height: screenWidth,
        color: Colors.white,
      ),
    );
  }

  Widget _buildErrorWidget(String message, double screenWidth) {
    return Container(
      width: screenWidth,
      height: screenWidth,
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(message),
          ),
          TextButton.icon(
            onPressed: () => controller.getProduct(),
            label: const Text('Retry'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
