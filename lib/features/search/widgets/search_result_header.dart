import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/features/product/product_detail/widgets/product_detail_content.dart';

class SearchResultHeader extends StatefulWidget {
  const SearchResultHeader({super.key});

  @override
  State<SearchResultHeader> createState() => _SearchResultHeaderState();
}

class _SearchResultHeaderState extends State<SearchResultHeader> {
  final List<String> results = ["Result 1", "Result 2", "Result 3"];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList.list(children: [
        const SizedBox(height: 10.0),
        Text("Top Results").headSmall.title,
        const SizedBox(height: 5.0),
        Text("What are you looking for?").bodyMedium.greyColor,
        const SizedBox(height: 20.0),
        Row(
          children: [
            Text("Products").bodyLarge.bold,
            SizedBox(width: 15.0),
            Align(
              alignment: Alignment.centerLeft,
              child: MiniTitle(
                  text: "3 Results",
                  color: AppColor.blueColor,
                  textColor: AppColor.blueColor),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
      ]),
    );
  }
}
