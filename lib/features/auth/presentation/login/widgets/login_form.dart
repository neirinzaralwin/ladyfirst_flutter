import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/string_extensions.dart';
import 'package:lady_first_flutter/features/auth/controllers/login_controller.dart';
import 'package:lady_first_flutter/widgets/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  LoginController get loginController => Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Phone").bodyMedium.greyColor,
          ),
          CustomTextFormField(
            text: "phone".startCapitalize,
            hint: "09 123456789",
            controller: loginController.phoneController,
            validator: null,
            enabledBorderColor: AppColor.grey,
            enableBorder: false,
            focusBorderColor: AppColor.grey,
            fillColor: Colors.grey[200],
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Password").bodyMedium.greyColor,
          ),
          CustomTextFormField(
            text: "password".startCapitalize,
            hint: "********",
            controller: loginController.passwordController,
            validator: null,
            enabledBorderColor: AppColor.grey,
            enableBorder: false,
            focusBorderColor: AppColor.grey,
            fillColor: Colors.grey[200],
            isPassword: true,
            iconColor: AppColor.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 12.0,
                ),
                child: Obx(
                  () => GestureDetector(
                    onTap: loginController.isPhoneNotEmpty ? () => [] : null,
                    child:
                        Text(
                          "Forgot password ?",
                          style: TextStyle(
                            color:
                                loginController.isPhoneNotEmpty
                                    ? AppColor.primaryColor
                                    : AppColor.grey,
                          ),
                        ).bodyMedium.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.maxFinite,
            height: 50.0,
            child: Obx(
              () => ElevatedButton(
                onPressed: loginController.isReady ? _login : null,
                child: Text("login".startCapitalize).bodyMedium.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      loginController.login();
    }
  }
}
