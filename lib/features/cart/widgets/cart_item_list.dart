import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class CartItemList extends StatefulWidget {
  const CartItemList({super.key});

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  final double imageWidth = 150.0;
  final double horizontalPadding = 20.0;

  double get getTextWidth {
    return ScreenDimension.getWidth(context) -
        imageWidth -
        (horizontalPadding * 2) -
        30;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          height: 200,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: SizedBox(
                  height: 200,
                  width: imageWidth,
                  child: CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/200/300?random=$index',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: getTextWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name Product Name Product Name Product Name Product Name Product Name ",
                        maxLines: 3,
                        softWrap: true,
                      ).bodyLarge.bold,
                      const SizedBox(height: 5.0),
                      Text("200 ml").bodyMedium.greyColor,
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Text("\$10.00").bodyLarge.bold,
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: HugeIcon(
                                  icon: HugeIcons.strokeRoundedCancel01,
                                  color: AppColor.darkGray)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: 2,
    );
  }
}
