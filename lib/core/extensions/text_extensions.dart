import 'package:flutter/material.dart';

extension TextExtensions on Text {
  Text get startCapitalize {
    return Text("${data![0].toUpperCase()}${data!.substring(1).toLowerCase()}");
  }

  Text get capitalized {
    return Text(data!.split(" ").map((e) => e.toUpperCase()).join(" "));
  }
}
