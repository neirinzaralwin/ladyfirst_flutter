import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class HomePopularProductsWidget extends StatefulWidget {
  const HomePopularProductsWidget({super.key});

  @override
  State<HomePopularProductsWidget> createState() =>
      _HomePopularProductsWidgetState();
}

class _HomePopularProductsWidgetState extends State<HomePopularProductsWidget> {
  final List<String> _dummyProducts =
      List.generate(10, (index) => 'Product $index');
  final productHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: [
                Text("Popular Products").headMedium.bold,
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
          SizedBox(
            height: productHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _dummyProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: () =>
                        AppPages.router.pushNamed(Routes.productDetail),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.accentColor2,
                            border: Border.all(
                                width: 0.5, color: AppColor.mildGray),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      color: AppColor.mildGray,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://picsum.photos/200/300?random=$index'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  // love react button
                                  Positioned(
                                    top: 10.0,
                                    right: 10.0,
                                    child: Container(
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.black
                                              .withValues(alpha: 0.05),
                                          shape: BoxShape.circle,
                                        ),
                                        child: HugeIcon(
                                            icon: HugeIcons
                                                .strokeRoundedFavourite,
                                            color: AppColor.white)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10.0),
                                height: 50.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(_dummyProducts[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true)
                                        .bodyMedium
                                        .bold,
                                    Text("\$100").bodyMedium.orangeColor.bold,
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
