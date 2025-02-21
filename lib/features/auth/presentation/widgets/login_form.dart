import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/string_extensions.dart';
import 'package:lady_first_flutter/widgets/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: "phone".startCapitalize,
            hint: "+66 123456789",
            controller: _phoneController,
            validator: checkEmail,
            enabledBorderColor: AppColor.mildGray,
            focusBorderColor: AppColor.grey,
            fillColor: AppColor.white,
          ),
          const SizedBox(height: 20.0),
          CustomTextFormField(
            text: "password".startCapitalize,
            hint: "********",
            controller: _passwordController,
            validator: (val) => checkPassword(val, "password"),
            enabledBorderColor: AppColor.mildGray,
            focusBorderColor: AppColor.grey,
            fillColor: AppColor.white,
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
                child: GestureDetector(
                  onTap: () => [],
                  child:
                      const Text(
                        "Forgot password ?",
                      ).bodyMedium.primaryColor.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.maxFinite,
            height: 50.0,
            child: ElevatedButton(
              onPressed: _login,
              child: Text("login".startCapitalize).bodyMedium.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _login() {
    // AppPages.router.pushNamed(Routes.home);
    if (_formKey.currentState!.validate()) {}
  }

  String? checkPassword(val, String text) {
    if (val.isEmpty) return "$text cannot be empty";
    if (val.length < 6) return "$text must be at least 6 characters";
    return null;
  }

  String? checkEmail(val) {
    if (val.isEmpty) return "Email cannot be empty";
    if (!val.isEmail) return "Invalid email";
    return null;
  }
}
