import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/services/google_service.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _isPhoneNotEmpty = false.obs;
  bool get isPhoneNotEmpty => _isPhoneNotEmpty.value;

  final _isReady = false.obs;
  bool get isReady => _isReady.value;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(_updateReadyState);
    passwordController.addListener(_updateReadyState);
  }

  void _updateReadyState() {
    _isReady.value = _checkReadyToLogin();
  }

  bool _checkReadyToLogin() {
    if (!_checkIsPhoneNotEmpty() ||
        passwordController.text.isEmpty ||
        phoneController.text.length < 8 ||
        passwordController.text.length < 6) {
      return false;
    }
    return true;
  }

  bool _checkIsPhoneNotEmpty() {
    if (phoneController.text.isNotEmpty) {
      _isPhoneNotEmpty.value = true;
      return true;
    } else {
      _isPhoneNotEmpty.value = false;
      return false;
    }
  }

  void login() {
    debugPrint(
      'Login with: ${phoneController.text} / ${passwordController.text}',
    );
  }

  void loginWithGoogle() async {
    try {
      _isLoading(true);
      await GoogleSignInService.signInWithGoogle();
    } catch (e) {
      debugPrint("Error in login with google: $e");
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
    } finally {
      _isLoading(false);
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
