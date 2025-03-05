import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class RegisterHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const RegisterHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Text(title).largeTitle.bold]),
        const SizedBox(width: 10.0),
        Text(subTitle).bodyMedium.greyColor,
        const SizedBox(height: 35.0),
      ],
    );
  }
}
