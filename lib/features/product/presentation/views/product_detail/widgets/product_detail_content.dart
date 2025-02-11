import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/string_extensions.dart';
import 'package:lady_first_flutter/features/product/presentation/cubits/get_product/get_product_cubit.dart';
import 'package:lady_first_flutter/widgets/shimmer/shimmer_widget.dart';
import 'package:lady_first_flutter/widgets/text/expandable_text.dart';

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: BlocBuilder<GetProductCubit, GetProductState>(
          builder: (context, state) {
            return switch (state) {
              GetProductLoading() => const ProductDetailLoadingContent(),
              GetProductLoaded() => ProductDetailLoadedContent(state: state),
              GetProductError() => ProductDetailErrorContent(state: state),
              _ => const SizedBox.shrink(),
            };
          },
        ));
  }
}

class ProductDetailLoadedContent extends StatelessWidget {
  final GetProductLoaded state;
  const ProductDetailLoadedContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final product = state.product;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MiniTitle(text: "Name"),
            const MiniTitle(text: "Original Price"),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ).headSmall.bold,
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  product.originalPrice.currencyFormat,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColor.darkGray,
                    color: AppColor.darkGray,
                  ),
                ).headSmall,
                Text(product.secondHandPrice.currencyFormat)
                    .headSmall
                    .orangeColor
                    .bold,
              ],
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MiniTitle(text: "Condition"),
                const SizedBox(height: 5.0),
                Text(product.condition,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false)
                    .bodyMedium
                    .greyColor,
              ],
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const MiniTitle(text: "Info"),
                const SizedBox(height: 5.0),
                Text(product.size,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false)
                    .bodyMedium
                    .greyColor,
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        const MiniTitle(text: "About"),
        const SizedBox(height: 5.0),
        ExpandableText(
          text: product.description,
        ),
        const SizedBox(height: 20.0),
        const MiniTitle(
            text: "Authenticity Document",
            color: AppColor.blueColor,
            textColor: AppColor.blueColor),
        const SizedBox(height: 10.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: (product.authenticityDocument.isEmpty)
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 10.0),
                  child: Text('No authenticity document').bodySmall.greyColor,
                )
              : CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: product.authenticityDocument,
                  width: 100.0,
                  height: 100.0,
                ),
        ),
      ],
    );
  }
}

class ProductDetailLoadingContent extends StatelessWidget {
  const ProductDetailLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerWidget.rectangular(height: 20.0, width: 100.0),
            ShimmerWidget.rectangular(height: 20.0, width: 100.0),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ShimmerWidget.rectangular(height: 20.0),
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShimmerWidget.rectangular(height: 20.0, width: 50.0),
                const SizedBox(height: 5.0),
                ShimmerWidget.rectangular(height: 20.0, width: 50.0),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(height: 20.0, width: 100.0),
                const SizedBox(height: 5.0),
                ShimmerWidget.rectangular(height: 20.0, width: 50.0),
              ],
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShimmerWidget.rectangular(height: 20.0, width: 100.0),
                const SizedBox(height: 5.0),
                ShimmerWidget.rectangular(height: 20.0, width: 50.0),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        ShimmerWidget.rectangular(height: 20.0, width: 100.0),
        const SizedBox(height: 5.0),
        ShimmerWidget.rectangular(height: 100.0),
        const SizedBox(height: 20.0),
        ShimmerWidget.rectangular(height: 20.0, width: 200.0),
        const SizedBox(height: 10.0),
        ShimmerWidget.rectangular(height: 100.0, width: 100.0),
      ],
    );
  }
}

class ProductDetailErrorContent extends StatelessWidget {
  final GetProductError state;
  const ProductDetailErrorContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Error: ${state.message}'),
          ),
          TextButton.icon(
            onPressed: () {
              context.read<GetProductCubit>().getProduct();
            },
            label: const Text('Retry'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class MiniTitle extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  const MiniTitle({super.key, required this.text, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 0.5, color: color ?? AppColor.secondaryColor),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor ?? AppColor.secondaryColor),
      ).bodySmall,
    );
  }
}
