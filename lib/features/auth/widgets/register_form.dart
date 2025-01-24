import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/string_extensions.dart';
import 'package:lady_first_flutter/widgets/custom_textfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              text: "name".startCapitalize,
              hint: "eg. John Doe",
              controller: _nameController,
              validator: (val) => checkNull(val, "name"),
              enabledBorderColor: AppColor.grey,
              focusBorderColor: AppColor.darkGray,
              fillColor: AppColor.mildGray,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              text: "username".startCapitalize,
              hint: "johndoe",
              controller: _usernameController,
              validator: (val) => checkNull(val, "username"),
              enabledBorderColor: AppColor.grey,
              focusBorderColor: AppColor.darkGray,
              fillColor: AppColor.mildGray,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              text: "email".startCapitalize,
              hint: "johndoe@gmail.com",
              controller: _emailController,
              validator: checkEmail,
              enabledBorderColor: AppColor.grey,
              focusBorderColor: AppColor.darkGray,
              fillColor: AppColor.mildGray,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              text: "password".startCapitalize,
              hint: "********",
              controller: _passwordController,
              validator: (val) => checkPassword(val, "password"),
              enabledBorderColor: AppColor.grey,
              focusBorderColor: AppColor.darkGray,
              isPassword: true,
              fillColor: AppColor.mildGray,
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              text: "re_enter_password".startCapitalize,
              hint: "********",
              controller: _passwordController,
              validator: checkReEnterPassword,
              enabledBorderColor: AppColor.grey,
              focusBorderColor: AppColor.darkGray,
              isPassword: true,
              fillColor: AppColor.mildGray,
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.maxFinite,
              height: 50.0,
              child: ElevatedButton(
                onPressed: _register,
                child: Text(
                  "register".startCapitalize,
                ).bodyMedium.bold,
              ),
            ),
          ],
        ));
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Register user
    }
  }

  String? checkNull(val, String text) {
    if (val.isEmpty) return "$text cannot be empty";
    return null;
  }

  String? checkPassword(val, String text) {
    if (val.isEmpty) return "$text cannot be empty";
    if (val.length < 6) return "$text must be at least 6 characters";
    return null;
  }

  String? checkReEnterPassword(val) {
    if (val.isEmpty) return "Re-enter password cannot be empty";
    if (val != _passwordController.text) return "Passwords do not match";
    return null;
  }

  String? checkEmail(val) {
    if (val.isEmpty) return "Email cannot be empty";
    if (!val.isEmail) return "Invalid email";
    return null;
  }
}
