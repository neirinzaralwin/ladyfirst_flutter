import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_const.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/text_extensions.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => AppPages.router.pop(),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0),
            Text(AppConst.APP_NAME).title.bold.primaryColor,
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: const Text("login").startCapitalize.headLarge.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            const LoginForm(),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Row(
                  children: [
                    const Text("Don't have account?").bodyMedium,
                    const SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () => AppPages.router.pushNamed(Routes.register),
                      child: const Text("Sign up").bodyMedium.bold.primaryColor,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20.0),
            _buildDivider(),
            const SizedBox(height: 20.0),
            _buildSocialLogins(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Image.asset("assets/icons/google_icon.png",
                width: 30.0, height: 30.0),
            title: const Text("Continue with google").bodyMedium,
            tileColor: AppColor.white,
            textColor: AppColor.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onTap: () => [],
          ),
        ),
        const SizedBox(height: 10.0),
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/icons/apple_icon.png",
              width: 30.0,
              height: 30.0,
              color: AppColor.white,
            ),
            title: const Text("Continue with apple").bodyMedium,
            tileColor: AppColor.black,
            textColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    Widget divider = SizedBox(
      width: ScreenDimension.getWidth(context) * 0.1,
      child: const Divider(color: AppColor.grey),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        divider,
        const SizedBox(width: 10.0),
        const Text("or").capitalized.bodyMedium.greyColor,
        const SizedBox(width: 10.0),
        divider,
      ],
    );
  }
}
