import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/features/product/presentation/cubits/get_product/get_product_cubit.dart';
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
  late GetProductCubit _getProductCubit;

  @override
  void initState() {
    super.initState();
    _getProductCubit = GetProductCubit();
    _getProductCubit.productId = widget.productId;
    _getProductCubit.getProduct();
  }

  Future<void> _handleRefresh() async {
    await HapticFeedback.lightImpact();
    await _getProductCubit.refreshProduct();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getProductCubit,
      child: BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: productDetailAppBar(),
            bottomNavigationBar: productDetailBottomNavigationBar(),
            body: CustomScrollView(
              physics: (state is GetProductLoading)
                  ? NeverScrollableScrollPhysics()
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
                    return Center(
                      child: SizedBox(
                        height: 16.0,
                        width: 16.0,
                        child: const CupertinoActivityIndicator(),
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
            ),
          );
        },
      ),
    );
  }
}
