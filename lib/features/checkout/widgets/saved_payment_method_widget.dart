import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class SavedPaymentMethodWidget extends StatefulWidget {
  const SavedPaymentMethodWidget({super.key});

  @override
  State<SavedPaymentMethodWidget> createState() =>
      _SavedPaymentMethodWidgetState();
}

class _SavedPaymentMethodWidgetState extends State<SavedPaymentMethodWidget> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment methods").headSmall.bold,
        SizedBox(height: 5.0),
        RadioListTile<int>(
          value: 0,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value!;
            });
          },
          title: Text(
            "Visa",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).bodyMedium.bold.black,
          subtitle: Text("**** **** **** 1234").bodyMedium.greyColor,
          secondary: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColor.mildGray,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.asset(
              "assets/icons/visa.png",
              width: 25.0,
              height: 25.0,
            ),
          ),
        ),
        RadioListTile<int>(
          value: 1,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value!;
            });
          },
          title: Text(
            "MasterCard",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).bodyMedium.bold.black,
          subtitle: Text("**** **** **** 5678").bodyMedium.greyColor,
          secondary: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColor.mildGray,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.asset(
              "assets/icons/visa.png",
              width: 25.0,
              height: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}
