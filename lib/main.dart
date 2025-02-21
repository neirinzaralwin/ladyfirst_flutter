import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_const.dart';
import 'package:lady_first_flutter/core/constants/app_theme.dart';
import 'core/constants/app_pages.dart';
import 'core/configs/app_binding.dart' as app_binding;

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      // Enable Crashlytics in release mode
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        !kDebugMode,
      );

      // Catch Flutter errors
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      // Catch platform errors
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      await app_binding.init();
      runApp(const MyApp());
    },
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: getThemeData(context),
      routerConfig: AppPages.router,
    );
  }
}
