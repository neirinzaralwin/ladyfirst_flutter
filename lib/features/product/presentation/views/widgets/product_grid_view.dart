import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/features/product/presentation/controllers/product_controller.dart';
import 'package:lady_first_flutter/core/extensions/text_extensions.dart';
import 'package:lady_first_flutter/features/product/presentation/views/widgets/product_loading_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Obx(() {
      final state = productController.getProductsState.value;

      if (state is GetProductsLoadingState) {
        return const ProductLoadingGridView(childCount: 4);
      }

      if (state is GetProductsErrorState) {
        return SliverToBoxAdapter(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Error: ${state.error}'),
                ),
                TextButton.icon(
                  onPressed: () => productController.getProducts(),
                  label: const Text('Retry'),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        );
      }

      if (productController.products.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('No products available'),
            ),
          ),
        );
      }

      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final product = productController.products[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap:
                    () => AppPages.router.pushNamed(
                      Routes.productDetail,
                      pathParameters: {'productId': product.id.toString()},
                    ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.accentColor2,
                      border: Border.all(
                        width: 0.5,
                        color: AppColor.accentColor,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: product.image,
                                  fit: BoxFit.cover,
                                  errorWidget:
                                      (context, url, error) => const Center(
                                        child: Icon(Icons.error),
                                      ),
                                  placeholder:
                                      (context, url) => Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(color: Colors.white),
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              height: 80,
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title).bodyMedium.bold,
                                  Text(product.condition).bodySmall.greyColor,
                                  const SizedBox(height: 2.0),
                                  Text(
                                    product.secondHandPrice,
                                  ).currencyFormat.bodyMedium.orangeColor.bold,
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 10.0,
                          right: 10.0,
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: AppColor.black.withValues(alpha: 0.05),
                              shape: BoxShape.circle,
                            ),
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedFavourite,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, childCount: productController.products.length),
        ),
      );
    });
  }
}
