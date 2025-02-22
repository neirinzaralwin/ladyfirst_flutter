import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/text_extensions.dart';
import 'package:lady_first_flutter/features/auth/controllers/login_controller.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Get.put(LoginController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => AppPages.router.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),
              const SizedBox(height: 20.0),
              _buildDivider(),
              const SizedBox(height: 20.0),
              _buildSocialLogins(),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?").bodyMedium.greyColor,
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () => AppPages.router.pushNamed(Routes.terms),
                    child: const Text("Sign up").bodyMedium.bold.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: AppColor.mildGray),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/google_icon.png",
                width: 20.0,
                height: 20.0,
              ),
              const SizedBox(width: 10.0),
              const Text("Continue with google").bodyMedium,
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: AppColor.mildGray),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/apple_icon.png",
                width: 20.0,
                height: 20.0,
              ),
              const SizedBox(width: 10.0),
              const Text("Continue with apple").bodyMedium,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    Widget divider = SizedBox(
      width: ScreenDimension.getWidth(context) * 0.35,
      child: const Divider(color: AppColor.grey, thickness: 0.5),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        divider,
        const SizedBox(width: 10.0),
        const Text("or").capitalized.bodySmall.greyColor,
        const SizedBox(width: 10.0),
        divider,
      ],
    );
  }
}
