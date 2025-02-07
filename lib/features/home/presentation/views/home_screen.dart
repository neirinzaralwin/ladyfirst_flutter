import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:lady_first_flutter/features/product/presentation/cubits/get_home_products/get_home_products_cubit.dart';
import '../../../product/presentation/views/widgets/product_grid_view.dart';
import '../../../product/presentation/views/widgets/product_header_widget.dart';
import 'widgets/home_carousel_widget.dart';
import 'widgets/home_categories_widget.dart';
import 'widgets/home_popular_products_widget.dart';
import 'widgets/inspiring_refresh_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetHomeProductsCubit _getHomeProductsCubit;

  @override
  void initState() {
    super.initState();
    _getHomeProductsCubit = GetHomeProductsCubit();
    _getHomeProductsCubit.getProducts();
  }

  Future<void> _handleRefresh() async {
    // Light haptic feedback
    await HapticFeedback.lightImpact();
    await _getHomeProductsCubit.refreshProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getHomeProductsCubit,
      child: Scaffold(
        appBar: homeAppBar(),
        body: InspiringRefreshIndicator(
          onRefresh: _handleRefresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              HomeCarouselWidget(),
              HomeCategoriesWidget(),
              HomePopularProductsWidget(),
              SliverToBoxAdapter(
                child: SizedBox(height: 15.0),
              ),
              ProductHeaderWidget(),
              ProductGridView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _getHomeProductsCubit.close();
    super.dispose();
  }
}
