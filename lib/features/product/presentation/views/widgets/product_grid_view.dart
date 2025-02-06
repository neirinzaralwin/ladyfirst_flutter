import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => AppPages.router.pushNamed(Routes.productDetail),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.accentColor2,
                    border: Border.all(width: 0.5, color: AppColor.accentColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://picsum.photos/200/300?random=$index',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product $index').bodyMedium.bold,
                                Text('9.5/10').bodySmall.greyColor,
                                const SizedBox(height: 2.0),
                                Text('\$${index * 100}')
                                    .bodyMedium
                                    .orangeColor
                                    .bold,
                              ],
                            ),
                          ),
                        ],
                      ),

                      // love react button
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.05),
                              shape: BoxShape.circle,
                            ),
                            child: HugeIcon(
                                icon: HugeIcons.strokeRoundedFavourite,
                                color: AppColor.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
