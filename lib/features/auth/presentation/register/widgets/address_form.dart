import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/core/extensions/string_extensions.dart';
import 'package:lady_first_flutter/features/auth/controllers/register_controller.dart';
import 'package:lady_first_flutter/widgets/custom_textfield.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  RegisterController get registerController => Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text("country".startCapitalize).bodyMedium.greyColor,
                const SizedBox(width: 5.0),
                Text("*").bodyMedium.redColor,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColor.grey),
            ),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              value: registerController.selectedCountry,
              hint: Text("Select country").bodyMedium,
              isExpanded: true,
              items:
                  registerController.countries.map((String country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(country).bodyMedium,
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  registerController.selectedCountry = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text("city".startCapitalize).bodyMedium.greyColor,
                const SizedBox(width: 5.0),
                Text("*").bodyMedium.redColor,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColor.grey),
            ),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              value: registerController.selectedCity,
              hint: Text("Select city").bodyMedium,
              isExpanded: true,
              items:
                  registerController.cities.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city).bodyMedium,
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  registerController.selectedCity = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text("province".startCapitalize).bodyMedium.greyColor,
                const SizedBox(width: 5.0),
                Text("*").bodyMedium.redColor,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColor.grey),
            ),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              value: registerController.selectedProvince,
              hint: Text("Select province").bodyMedium,
              isExpanded: true,
              items:
                  registerController.provinces.map((String province) {
                    return DropdownMenuItem<String>(
                      value: province,
                      child: Text(province).bodyMedium,
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  registerController.selectedProvince = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text("address".startCapitalize).bodyMedium.greyColor,
                const SizedBox(width: 5.0),
                Text("*").bodyMedium.redColor,
              ],
            ),
          ),
          CustomTextFormField(
            text: "address".startCapitalize,
            hint: "No.123, 111 Street, Building D",
            controller: registerController.addressController,
            validator: null,
            enabledBorderColor: AppColor.grey,
            enableBorder: false,
            focusBorderColor: AppColor.grey,
            fillColor: Colors.grey[200],
          ),
          const SizedBox(height: 50.0),
          Obx(
            () => SizedBox(
              width: double.maxFinite,
              height: 50.0,
              child: ElevatedButton(
                onPressed:
                    registerController.isAddressReady
                        ? () => registerController.register()
                        : null,
                child: Text("done".startCapitalize).bodyMedium.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
