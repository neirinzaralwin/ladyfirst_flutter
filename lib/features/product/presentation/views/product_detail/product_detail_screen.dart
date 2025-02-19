import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/features/product/presentation/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/product_detail_app_bar.dart';
import 'widgets/product_detail_bottom_navigation_bar.dart';
import 'widgets/product_detail_content.dart';
import 'widgets/product_detail_image_view.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _productController = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    _productController.currentProductId = widget.productId;
    _productController.getProduct();
  }

  Future<void> _handleRefresh() async {
    await HapticFeedback.lightImpact();
    await _productController.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productDetailAppBar(),
      bottomNavigationBar: productDetailBottomNavigationBar(_productController),
      body: Obx(() {
        return CustomScrollView(
          physics: (_productController.getCurrentProductState.value
                  is GetCurrentProductLoadingState)
              ? const NeverScrollableScrollPhysics()
              : null,
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: _handleRefresh,
              builder: (
                BuildContext context,
                RefreshIndicatorMode mode,
                double pulledExtent,
                double refreshTriggerPullDistance,
                double refreshIndicatorExtent,
              ) {
                return const Center(
                  child: SizedBox(
                    height: 16.0,
                    width: 16.0,
                    child: CupertinoActivityIndicator(),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ProductDetailImageView(),
                  ProductDetailContent(),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
