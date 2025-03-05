import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';

class RegisterController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final cities = ['Hanoi', 'HCMC', 'Danang', 'Hue', 'Hai Phong'];
  final _selectedCity = Rxn<String>();
  String? get selectedCity => _selectedCity.value;
  set selectedCity(String? value) => _selectedCity.value = value;

  final countries = ['Myanmar', 'Thailand'];
  final _selectedCountry = Rxn<String>();
  String? get selectedCountry => _selectedCountry.value;
  set selectedCountry(String? value) => _selectedCountry.value = value;

  final provinces = ['Bangkok'];
  final _selectedProvince = Rxn<String>();
  String? get selectedProvince => _selectedProvince.value;
  set selectedProvince(String? value) => _selectedProvince.value = value;

  final addressController = TextEditingController();

  final _isAddressReady = false.obs;
  bool get isAddressReady => _isAddressReady.value;

  final _isReady = false.obs;
  bool get isReady => _isReady.value;

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_updateReadyState);
    phoneController.addListener(_updateReadyState);
    passwordController.addListener(_updateReadyState);

    _selectedCountry.listen((_) => _updateAddressReadyState());
    _selectedCity.listen((_) => _updateAddressReadyState());
    _selectedProvince.listen((_) => _updateAddressReadyState());
    addressController.addListener(_updateAddressReadyState);
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
    AppPages.router.pushNamed(Routes.registerAddress);
  }

  void _updateAddressReadyState() {
    _isAddressReady.value =
        selectedCountry != null &&
        selectedCity != null &&
        selectedProvince != null &&
        addressController.text.isNotEmpty;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    selectedCity = null;
    selectedCountry = null;
    selectedProvince = null;
    super.onClose();
  }
}
