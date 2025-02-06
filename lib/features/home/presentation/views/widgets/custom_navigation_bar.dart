import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/constants/app_color.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        int navigatorIndex = widget.navigationShell.currentIndex;
        widget.navigationShell.goBranch(currentIndex,
            initialLocation: navigatorIndex == currentIndex);
      },
      items: const [
        BottomNavigationBarItem(
            tooltip: "Home",
            activeIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedBrowser,
                color: AppColor.primaryColor),
            icon: HugeIcon(
                icon: HugeIcons.strokeRoundedBrowser, color: AppColor.grey),
            label: "Home"),
        BottomNavigationBarItem(
            tooltip: "User profile",
            activeIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedUserCircle,
                color: AppColor.primaryColor),
            icon: HugeIcon(
                icon: HugeIcons.strokeRoundedUserCircle, color: AppColor.grey),
            label: "Profile"),
      ],
      selectedItemColor: AppColor.primaryColor,
    );
  }
}
