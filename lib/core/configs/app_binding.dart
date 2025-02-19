import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_const.dart';
import 'package:lady_first_flutter/core/network/api_client.dart';
import 'package:lady_first_flutter/features/product/data/repositories/product_repository.dart';
import 'package:lady_first_flutter/features/product/presentation/controllers/product_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  Get.put(await SharedPreferences.getInstance(), permanent: true);

  // * For APi------------------------------------------------------------>
  Get.put(
      ApiClient(
          appBaseUrl: AppConst.BASE_URL,
          sharedPreferences: Get.find<SharedPreferences>()),
      permanent: true);

  // * For Repositories --------------------------------------------------->
  final ApiClient apiClient = Get.find<ApiClient>();
  Get.put(ProductRepository(apiClient: apiClient), permanent: true);

  // * For Controllers --------------------------------------------------->
  Get.lazyPut(() => ProductController());
}
