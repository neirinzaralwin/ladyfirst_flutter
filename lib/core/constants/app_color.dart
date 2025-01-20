import 'package:flutter/material.dart';

class AppColor {
  static const Color swatch = Color(0xff000000);
  static const Color primaryColor = Color(0xFF48482c);
  static const Color secondaryColor = Color(0xFFd2be98);
  static const Color orangeColor = Color(0xFFfda33b);
  static const Color accentColor = Color(0xFFeceae4);
  static const Color accentColor2 = Color(0xFFf6f5ec);
  static const Color mildGreen = Color.fromARGB(255, 205, 221, 213);
  static const Color veryMildGreen = Color.fromARGB(255, 243, 243, 243);
  static const Color iosGreen = Color.fromARGB(255, 20, 232, 87);
  static const Color blueColor = Color.fromARGB(255, 0, 114, 155);
  static const Color redColor = Color.fromARGB(255, 189, 44, 4);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xffa8a8a8);
  static const Color mildGray = Color.fromARGB(255, 231, 231, 231);
  static const Color darkGray = Color(0xff4a4a4a);
  static const Color appBarColor = Color.fromARGB(255, 250, 250, 250);
  static const Color scaffoldBackgroundColor = Colors.white;
  static const Color shimmerBaseColor = Color.fromARGB(255, 222, 222, 222);
  static const Color shimmerHighlightColor = Color.fromARGB(230, 255, 255, 255);
}

const Gradient shimmerDarkGradient = LinearGradient(
  colors: [
    AppColor.black,
    Color.fromARGB(255, 51, 51, 51),
    AppColor.black,
    Color.fromARGB(255, 51, 51, 51)
  ],
);
const Gradient shimmerLightGradient = LinearGradient(
  colors: [
    Colors.white,
    Color.fromARGB(255, 222, 222, 222),
    Colors.white,
    Color.fromARGB(255, 222, 222, 222)
  ],
);
