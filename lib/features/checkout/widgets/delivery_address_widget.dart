import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

import '../../../core/constants/app_color.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Delivery Address").headSmall.bold,
        SizedBox(height: 5.0),
        ListTile(
          onTap: () => [],
          minLeadingWidth: 0.0,
          leading: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColor.mildGray,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: HugeIcon(
                icon: HugeIcons.strokeRoundedLocation01, color: AppColor.black),
          ),
          title: Text(
            "123 Bangkapi Road, Bangkapi, Bangkok",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).bodyMedium.bold.black,
          subtitle: Text("Bangkok").bodyMedium.greyColor,
          trailing: Icon(CupertinoIcons.right_chevron),
        ),
      ],
    );
  }
}
