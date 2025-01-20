import 'dart:io';

import 'package:lady_first_flutter/core/network/api_service.dart';

import '../constants/app_const.dart';
import '../network/dio_configs.dart';

Future<void> appConfig({required bool isProduction}) async {
  String basedURL = isProduction
      ? AppConst.PRODUCTION_URL
      : (Platform.isAndroid ? AppConst.ANDROID_BASE_URL : AppConst.BASE_URL);
  final dioConfig = DioConfigs(baseUrl: basedURL, token: '');
  final dio = dioConfig.init();
  ApiService.init(dio);
}
