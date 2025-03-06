import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/features/auth/controllers/register_controller.dart';
import 'package:lady_first_flutter/features/auth/presentation/register/widgets/address_form.dart';
import 'package:lady_first_flutter/features/auth/presentation/register/widgets/register_header.dart';

class RegisterAddressScreen extends StatefulWidget {
  const RegisterAddressScreen({super.key});

  @override
  State<RegisterAddressScreen> createState() => _RegisterAddressScreenState();
}

class _RegisterAddressScreenState extends State<RegisterAddressScreen> {
  RegisterController get registerController => Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Obx(() {
        if (registerController.isRegisterLoading) {
          return Material(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CupertinoActivityIndicator(),
                  const SizedBox(height: 10.0),
                  Text("Registering...").bodyMedium,
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const RegisterHeader(
                    title: "Address",
                    subTitle: "Please enter your address.",
                  ),
                  const AddressForm(),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
