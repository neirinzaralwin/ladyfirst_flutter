import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TextExtensions on Text {
  Text get startCapitalize {
    return Text("${data![0].toUpperCase()}${data!.substring(1).toLowerCase()}");
  }

  Text get capitalized {
    return Text(data!.split(" ").map((e) => e.toUpperCase()).join(" "));
  }

  Text get currencyFormat {
    final formatter = NumberFormat("#,##0.00", "en_US");
    // Remove currency symbol and spaces before parsing
    final cleanString = data?.replaceAll(RegExp(r'[^\d.]'), '') ?? '0';
    final number = double.tryParse(cleanString) ?? 0;
    return Text('\$${formatter.format(number)}');
  }
}
