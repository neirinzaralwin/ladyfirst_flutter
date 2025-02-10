import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/features/product/presentation/cubits/get_product/get_product_cubit.dart';
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
  late GetProductCubit _getProductCubit;

  @override
  void initState() {
    super.initState();
    _getProductCubit = GetProductCubit();
    _getProductCubit.productId = widget.productId;
    _getProductCubit.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getProductCubit,
      child: Scaffold(
        appBar: productDetailAppBar(),
        bottomNavigationBar: productDetailBottomNavigationBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductDetailImageView(),
              ProductDetailContent(),
            ],
          ),
        ),
      ),
    );
  }
}
