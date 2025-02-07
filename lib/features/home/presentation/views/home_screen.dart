import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:lady_first_flutter/features/product/presentation/cubits/get_home_products/get_home_products_cubit.dart';
import '../../../product/presentation/views/widgets/product_grid_view.dart';
import '../../../product/presentation/views/widgets/product_header_widget.dart';
import 'widgets/home_carousel_widget.dart';
import 'widgets/home_categories_widget.dart';
import 'widgets/home_popular_products_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetHomeProductsCubit()..getProducts(),
      child: Scaffold(
        appBar: homeAppBar(),
        body: CustomScrollView(
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
    );
  }
}
