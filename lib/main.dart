import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_const.dart';
import 'package:lady_first_flutter/core/constants/app_theme.dart';
import 'core/constants/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: getThemeData(context),
      title: AppConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      routerConfig: AppPages.router,
    );
  }
}
