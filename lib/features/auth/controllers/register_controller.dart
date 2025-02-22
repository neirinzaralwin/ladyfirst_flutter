import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _isReady = false.obs;
  bool get isReady => _isReady.value;

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_updateReadyState);
    phoneController.addListener(_updateReadyState);
    passwordController.addListener(_updateReadyState);
  }

  void _updateReadyState() {
    _isReady.value = _checkReadyToRegister();
  }

  bool _checkReadyToRegister() {
    if (firstNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneController.text.length < 8 ||
        passwordController.text.length < 6 ||
        firstNameController.text.length < 2) {
      return false;
    }
    return true;
  }

  void register() {
    debugPrint(
      'Register with: ${firstNameController.text} / ${lastNameController.text} / ${phoneController.text} / ${passwordController.text}',
    );
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
