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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.0,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text("First Name").bodyMedium.greyColor,
                          const SizedBox(width: 5.0),
                          Text("*").bodyMedium.redColor,
                        ],
                      ),
                    ),
                    CustomTextFormField(
                      text: "first name".startCapitalize,
                      hint: "John",
                      controller: _firstNameController,
                      validator:
                          (val) => checkNull(val, 'first name'.startCapitalize),
                      enabledBorderColor: AppColor.grey,
                      enableBorder: false,
                      focusBorderColor: AppColor.grey,
                      fillColor: Colors.grey[200],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Last Name").bodyMedium.greyColor,
                    ),
                    CustomTextFormField(
                      text: "last name".startCapitalize,
                      hint: "Doe",
                      controller: _lastNameController,
                      validator: null,
                      enabledBorderColor: AppColor.grey,
                      enableBorder: false,
                      focusBorderColor: AppColor.grey,
                      fillColor: Colors.grey[200],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text("phone number".startCapitalize).bodyMedium.greyColor,
                const SizedBox(width: 5.0),
                Text("*").bodyMedium.redColor,
              ],
            ),
          ),
          CustomTextFormField(
            text: "phone number".startCapitalize,
            hint: "09 123456789",
            controller: _phoneController,
            isDigitOnly: true,
            validator: (val) => checkNull(val, "phone number".startCapitalize),
            enabledBorderColor: AppColor.grey,
            enableBorder: false,
            focusBorderColor: AppColor.grey,
            fillColor: Colors.grey[200],
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text("password".startCapitalize).bodyMedium.greyColor,
                const SizedBox(width: 5.0),
                Text("*").bodyMedium.redColor,
              ],
            ),
          ),
          CustomTextFormField(
            text: "password".startCapitalize,
            hint: "********",
            controller: _passwordController,
            isPassword: true,
            validator: (val) => checkPassword(val, "password".startCapitalize),
            enabledBorderColor: AppColor.grey,
            enableBorder: false,
            focusBorderColor: AppColor.grey,
            iconColor: AppColor.grey,
            fillColor: Colors.grey[200],
          ),
          const SizedBox(height: 5.0),

          const SizedBox(height: 20.0),
          SizedBox(
            width: double.maxFinite,
            height: 50.0,
            child: ElevatedButton(
              onPressed: _register,
              child: Text("register".startCapitalize).bodyMedium.bold,
            ),
          ),
        ],
      ),
    );
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
