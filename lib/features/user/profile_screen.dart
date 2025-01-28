import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/widgets/image/custom_cached_network_image.dart';

import 'widgets/profile_menu_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String profileImageUrl =
      "https://randomuser.me/api/portraits/women/85.jpg";
  final greenMarkAssetPath = "assets/icons/green_mark.png";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: ScreenDimension.getWidth(context) * 0.4,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      CustomCachedNetworkImage(
                        imageUrl:
                            "https://marketplace.canva.com/EAEmGBdkt5A/3/0/1600w/canva-blue-pink-photo-summer-facebook-cover-gy8LiIJTTGw.jpg",
                        width: ScreenDimension.getWidth(context),
                        height: ScreenDimension.getWidth(context) * 0.4,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.white,
                                width: 4,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColor.white,
                              child: CircleAvatar(
                                radius: 48,
                                backgroundImage: NetworkImage(profileImageUrl),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
                // Add these properties for title visibility control
                title: _AnimatedTitle(
                  visible: innerBoxIsScrolled,
                  text: "@sarah_johnson",
                ),
                floating: true,
                snap: true,
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileContent(),
                ProfileMenuList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "Sarah Johnson",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ).headMedium.bold.black,
              ),
              const SizedBox(width: 5.0),
              SizedBox(
                width: 15,
                height: 15,
                child: Image.asset(greenMarkAssetPath),
              )
            ],
          ),
          Text(
            "@sarah_johnson",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ).bodySmall.blueColor,
          const SizedBox(height: 16),
          const Text(
            "Digital Creator | Travel Enthusiast 🌍\nSharing moments that matter 📸",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 15.0,
            children: [
              Expanded(
                  child: CupertinoButton(
                      color: AppColor.primaryColor, // Change button color here
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Edit").bodyMedium.secondaryColor,
                          SizedBox(width: 8.0),
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedUserEdit01,
                            color: AppColor.secondaryColor,
                            size: 15.0,
                          )
                        ],
                      ),
                      onPressed: () {})),
              Expanded(
                  child: CupertinoButton(
                      color: AppColor.mildGray, // Change button color here
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Settings").bodyMedium.primaryColor,
                          SizedBox(width: 8.0),
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedSettings01,
                            color: AppColor.primaryColor,
                            size: 15.0,
                          )
                        ],
                      ),
                      onPressed: () {})),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     CircleAvatar(
          //       radius: 20,
          //       backgroundColor: Colors.white,
          //       backgroundImage: AssetImage('assets/icons/facebook_black.png'),
          //     ),
          //     CircleAvatar(
          //       radius: 20,
          //       backgroundColor: Colors.white,
          //       backgroundImage: AssetImage('assets/icons/instagram_black.png'),
          //     ),
          //     CircleAvatar(
          //       radius: 20,
          //       backgroundColor: Colors.white,
          //       backgroundImage: AssetImage('assets/icons/line_black.png'),
          //     ),
          //     CircleAvatar(
          //       radius: 20,
          //       backgroundColor: Colors.white,
          //       backgroundImage: AssetImage('assets/icons/web_black.png'),
          //     ),
          //     // Add other social icons here
          //   ],
          // ),
          const SizedBox(height: 24),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}

class _AnimatedTitle extends StatelessWidget {
  final bool visible;
  final String text;

  const _AnimatedTitle({required this.visible, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: Text(
        text,
      ).bodySmall.black,
    );
  }
}
