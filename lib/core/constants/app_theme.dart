import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_const.dart';

ThemeData getThemeData(context) => ThemeData(
  primarySwatch: primarySwatch,
  scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
  colorScheme: ColorScheme.light(
    primary: AppColor.primaryColor,
    secondary: AppColor.secondaryColor,
    surface: AppColor.scaffoldBackgroundColor,
    onPrimary: AppColor.white,
    onSecondary: AppColor.black,
    onSurface: AppColor.black,
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
    },
  ),
  // dialogBackgroundColor: AppColor.white,
  applyElevationOverlayColor: false,
  fontFamily: AppConst.APP_FONT,
  textTheme: Theme.of(context).textTheme.apply(fontFamily: AppConst.APP_FONT),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColor.primaryColor,
      side: const BorderSide(color: AppColor.primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      foregroundColor: AppColor.secondaryColor,
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
  ),
  popupMenuTheme: const PopupMenuThemeData(
    color: AppColor.scaffoldBackgroundColor,
    iconColor: AppColor.primaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColor.primaryColor),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: AppColor.black),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColor.appBarColor,
    iconTheme: IconThemeData(color: AppColor.black),
    titleTextStyle: TextStyle(
      color: AppColor.black,
      fontFamily: AppConst.APP_FONT,
      fontSize: 16.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColor.white,
    selectedItemColor: AppColor.primaryColor,
    unselectedItemColor: AppColor.grey,
    selectedIconTheme: IconThemeData(color: AppColor.primaryColor),
    unselectedIconTheme: IconThemeData(color: AppColor.grey),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(color: AppColor.primaryColor),
  ),
  useMaterial3: true,
);

final primarySwatch = MaterialColor(AppColor.swatch.hashCode, {
  50: tintColor(AppColor.swatch, 0.9),
  100: tintColor(AppColor.swatch, 0.8),
  200: tintColor(AppColor.swatch, 0.6),
  300: tintColor(AppColor.swatch, 0.4),
  400: tintColor(AppColor.swatch, 0.2),
  500: AppColor.swatch,
  600: shadeColor(AppColor.swatch, 0.1),
  700: shadeColor(AppColor.swatch, 0.2),
  800: shadeColor(AppColor.swatch, 0.3),
  900: shadeColor(AppColor.swatch, 0.4),
});

Color tintColor(Color color, double factor) =>
    Color.lerp(Colors.white, color, factor)!;

Color shadeColor(Color color, double factor) =>
    Color.lerp(Colors.black, color, factor)!;
