import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/string_extensions.dart';
import 'package:lady_first_flutter/features/auth/controllers/register_controller.dart';
import 'package:lady_first_flutter/widgets/custom_textfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  RegisterController get registerController => Get.find<RegisterController>();

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
                      controller: registerController.firstNameController,
                      validator: null,
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
                      controller: registerController.lastNameController,
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
            controller: registerController.phoneController,
            isDigitOnly: true,
            validator: null,
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
            controller: registerController.passwordController,
            isPassword: true,
            validator: null,
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
            child: Obx(
              () => ElevatedButton(
                onPressed:
                    registerController.isReady
                        ? registerController.register
                        : null,
                child: Text("register".startCapitalize).bodyMedium.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
