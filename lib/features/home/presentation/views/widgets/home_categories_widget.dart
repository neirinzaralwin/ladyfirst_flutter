import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_first_flutter/features/category/data/models/category.dart';
import 'package:lady_first_flutter/features/category/presentation/cubits/get_categories/get_categories_cubit.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({super.key});

  @override
  State<HomeCategoriesWidget> createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          height: 85,
          child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
            builder: (context, state) {
              return switch (state) {
                GetCategoriesLoading() => _buildCategoriesLoading(),
                GetCategoriesLoaded() => _buildCategoriesLoaded(state),
                GetCategoriesError() => _buildCategoriesError(state),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesLoaded(GetCategoriesLoaded state) {
    List<Category> categories = state.categories;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, index) {
        return Container(
          width: 80, // Fixed width for all items
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppColor.accentColor),
                ),
                child: SvgPicture.asset(
                  categories[index].url,
                  height: 26,
                  width: 26,
                  colorFilter: ColorFilter.mode(
                      AppColor.secondaryColor, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                categories[index].title,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor.primaryColor,
                ),
                textAlign: TextAlign.center, // Center align the text
                maxLines: 2, // Allow 2 lines for longer category names
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoriesError(GetCategoriesError state) {
    return Center(
      child: Text(
        state.message,
      ),
    );
  }

  Widget _buildCategoriesLoading() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, index) {
        return Container(
          width: 80,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 46, // 26 + 20 (padding)
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 60,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
