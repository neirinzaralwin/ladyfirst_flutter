import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class ProductHeaderWidget extends StatefulWidget {
  const ProductHeaderWidget({super.key});

  @override
  State<ProductHeaderWidget> createState() => _ProductHeaderWidgetState();
}

class _ProductHeaderWidgetState extends State<ProductHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            Text("Recents").headMedium.bold,
            const Spacer(),
            TextButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: () {},
              label: Text("See all").bodyMedium.primaryColor,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight02,
                color: AppColor.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
