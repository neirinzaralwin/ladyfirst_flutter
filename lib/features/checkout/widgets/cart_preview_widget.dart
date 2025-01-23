import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class CartPreviewWidget extends StatefulWidget {
  const CartPreviewWidget({super.key});

  @override
  State<CartPreviewWidget> createState() => _CartPreviewWidgetState();
}

class _CartPreviewWidgetState extends State<CartPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("My Cart").headSmall.bold,
        SizedBox(height: 15.0),
        SizedBox(
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10, // Replace with your actual item count
            itemBuilder: (context, index) {
              return Container(
                  width: 200.0,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 80.0,
                          height: 100.0,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://picsum.photos/200/300?random=$index',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator.adaptive()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        children: [
                          SizedBox(
                            width: 100.0,
                            child: Text(
                              "Product Name Product Name Product Name Product Name",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ).bodyMedium.bold,
                          ),
                          SizedBox(
                            width: 100.0,
                            child: Text(
                              "1 ps",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ).bodyMedium.greyColor,
                          ),
                          SizedBox(
                            width: 100.0,
                            child: Text(
                              "\$10.0",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ).bodyMedium.bold,
                          ),
                        ],
                      )
                    ],
                  ));
            },
          ),
        )
      ],
    );
  }
}
