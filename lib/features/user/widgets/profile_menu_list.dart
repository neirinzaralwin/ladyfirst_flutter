import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class ProfileMenuList extends StatelessWidget {
  ProfileMenuList({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': HugeIcons.strokeRoundedTruckDelivery,
      'title': 'Orders',
      'status': '2 Pending',
      'color': AppColor.primaryColor,
      'action': () {
        debugPrint('Orders');
      },
    },
    {
      'icon': HugeIcons.strokeRoundedFavourite,
      'title': 'Wishlist',
      'count': 2,
      'color': AppColor.primaryColor,
      'action': () => AppPages.router.pushNamed(Routes.favorite),
    },
    {
      'icon': HugeIcons.strokeRoundedTruck,
      'title': 'Completed',
      'status': '3 Orders',
      'color': AppColor.primaryColor,
      'action': () {},
    },
    {
      'icon': HugeIcons.strokeRoundedPaymentSuccess01,
      'title': 'Delivered',
      'status': '4 Packages',
      'color': AppColor.primaryColor,
      'action': () {},
    },
    {
      'icon': HugeIcons.strokeRoundedCustomerSupport,
      'title': 'Support',
      'color': AppColor.primaryColor,
      'action': () {},
    },
    {
      'icon': HugeIcons.strokeRoundedPolicy,
      'title': 'Policy',
      'color': AppColor.primaryColor,
      'action': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: menuItems.map((item) {
          return _buildMenuCard(
            icon: item['icon'],
            title: item['title'],
            status: item['status'],
            count: item['count'],
            color: item['color'],
            onTap: item['action'],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    String? status,
    int? count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColor.mildGray,
              border: Border.all(color: AppColor.secondaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HugeIcon(
                  icon: icon,
                  color: color,
                  size: 28,
                ),
                const SizedBox(height: 8),
                Text(title).bodySmall.primaryColor,
                if (status != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      status,
                    ).bodySmall.bold.primaryColor,
                  ),
              ],
            ),
          ),
          if (count != null)
            Positioned(
              top: 3,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  count.toString(),
                ).bodyMedium.secondaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
