import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/widgets/custom_textfield.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        leadingWidth: 35.0,
        toolbarHeight: 70.0,
        title: CustomTextFormField(
          text: "Search product",
          hint: "Search product",
          controller: TextEditingController(),
          validator: null,
          enableBorder: false,
          fillColor: AppColor.mildGray,
          prefixIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01, color: AppColor.grey),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedCancel01,
                  color: AppColor.darkGray)),
        ));
  }
}
