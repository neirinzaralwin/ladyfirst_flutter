import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({super.key});

  @override
  State<HomeCategoriesWidget> createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  List<Map<String, String>> categories = [
    {'name': 'Bags & Wallets', 'icon': 'assets/icons/bag_and_wallet.svg'},
    {'name': 'Footwears', 'icon': 'assets/icons/foot_wear.svg'},
    {'name': 'Tops', 'icon': 'assets/icons/tops.svg'},
    {'name': 'Dresses', 'icon': 'assets/icons/dresses_and_sets.svg'},
    {'name': 'Jewelry', 'icon': 'assets/icons/jewelry_and_organizers.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                constraints: BoxConstraints(minWidth: 60),
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
                        categories[index]['icon']!,
                        height: 26,
                        width: 26,
                        colorFilter: ColorFilter.mode(
                            AppColor.secondaryColor, BlendMode.srcIn),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      categories[index]['name']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
