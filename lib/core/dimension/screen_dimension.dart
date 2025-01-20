import 'package:flutter/material.dart';
// platform

class ScreenDimension {
  static double getWidth(BuildContext context, {double? width = 600.0}) {
    if (MediaQuery.of(context).size.width >= width!) {
      return width;
    }
    return MediaQuery.of(context).size.width;
  }

  static bool isMobileView(BuildContext context) {
    return MediaQuery.of(context).size.width < 600.0;
  }

  static bool isTabletView(BuildContext context) {
    return MediaQuery.of(context).size.width < 880.0;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
