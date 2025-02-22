import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [const Text("Register").largeTitle.bold]),
        const SizedBox(width: 10.0),
        Text("Create an account to do shopping.").bodyMedium.greyColor,
        const SizedBox(height: 35.0),
      ],
    );
  }
}
