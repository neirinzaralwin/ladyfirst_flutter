import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_const.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FlutterLogo(size: 20.0),
            const SizedBox(width: 10.0),
            Text(AppConst.APP_NAME).headSmall.bold.primaryColor,
          ],
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          width: 200.0,
          child: const Text("Sign in to your Account").largeTitle.bold,
        ),
        const SizedBox(width: 10.0),
        Text("Enter your email and password to login").bodyMedium.greyColor,
        const SizedBox(height: 35.0),
      ],
    );
  }
}
