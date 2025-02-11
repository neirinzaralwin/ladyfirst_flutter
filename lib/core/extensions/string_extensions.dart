// ignore_for_file: unnecessary_this

import 'package:intl/intl.dart';

extension TextExtensions on String {
  String get startCapitalize {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + this.substring(1);
  }

  String get capitalized {
    if (this.isEmpty) return this;
    return this.split(" ").map((e) => e.startCapitalize).join(" ");
  }

  String get currencyFormat {
    final formatter = NumberFormat("#,##0.00", "en_US");
    // Remove currency symbol and spaces before parsing
    final cleanString = this.replaceAll(RegExp(r'[^\d.]'), '');
    final number = double.tryParse(cleanString) ?? 0;
    final formattedNumber = formatter.format(number);
    final result = formattedNumber.endsWith('.00')
        ? formattedNumber.substring(0, formattedNumber.length - 3)
        : formattedNumber;
    return '฿$result';
  }
}
