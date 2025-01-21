import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/widgets/text/expandable_text.dart';

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
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
                  "Product Name",
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
                    "\$100.0",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColor.darkGray,
                      color: AppColor.darkGray,
                    ),
                  ).headSmall,
                  Text("\$80.0").headSmall.orangeColor.bold,
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
                  Text("Pretty good",
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
                  Text("1 ps",
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
            text: '''This is about product description ✨✨
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.    
''',
          ),
          const SizedBox(height: 20.0),
          const MiniTitle(
              text: "Authenticity Document",
              color: AppColor.blueColor,
              textColor: AppColor.blueColor),
          const SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: "https://picsum.photos/200/300?random=5",
              width: 100.0,
              height: 100.0,
            ),
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
