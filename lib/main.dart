import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_const.dart';
import 'package:lady_first_flutter/core/constants/app_theme.dart';
import 'core/constants/app_pages.dart';
import 'core/configs/app_binding.dart' as app_binding;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await app_binding.init();
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
