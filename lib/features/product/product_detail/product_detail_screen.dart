import 'package:flutter/material.dart';
import 'widgets/product_detail_app_bar.dart';
import 'widgets/product_detail_bottom_navigation_bar.dart';
import 'widgets/product_detail_content.dart';
import 'widgets/product_detail_image_view.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productDetailAppBar(),
      bottomNavigationBar: productDetailBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailImageView(images: [
              "https://picsum.photos/200/300?random=1",
              "https://picsum.photos/200/300?random=2",
              "https://picsum.photos/200/300?random=3",
              "https://picsum.photos/200/300?random=4",
            ]),
            ProductDetailContent(),
          ],
        ),
      ),
    );
  }
}
