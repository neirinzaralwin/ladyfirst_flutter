import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/features/product/presentation/cubits/get_product/get_product_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailImageView extends StatefulWidget {
  const ProductDetailImageView({super.key});

  @override
  State<ProductDetailImageView> createState() => _ProductDetailImageViewState();
}

class _ProductDetailImageViewState extends State<ProductDetailImageView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenDimension.getWidth(context);

    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        if (state is GetProductLoaded) {
          final image = state.product.image ?? "";

          return Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenWidth,
                decoration: BoxDecoration(
                  color: AppColor.black,
                ),
                child: PageView.builder(
                  itemCount: 1,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      "${_currentIndex + 1}/${1}",
                    ).bodySmall.white,
                  )),
            ],
          );
        }

        if (state is GetProductLoaded) return _buildLoadingWidget(screenWidth);

        if (state is GetProductError) {
          return _buildErrorWidget(state.message, screenWidth);
        }

        return SizedBox(
          width: screenWidth,
          height: screenWidth,
        );
      },
    );
  }

  Widget _buildLoadingWidget(screenWidth) {
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

  Widget _buildErrorWidget(String message, screenWidth) {
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
            onPressed: () => context.read<GetProductCubit>().getProduct(),
            label: const Text('Retry'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
