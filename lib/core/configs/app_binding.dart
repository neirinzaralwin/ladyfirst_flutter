import 'package:get/get.dart';
import 'package:lady_first_flutter/core/constants/app_const.dart';
import 'package:lady_first_flutter/core/network/api_client.dart';
import 'package:lady_first_flutter/features/category/data/repositories/category_repository.dart';
import 'package:lady_first_flutter/features/category/presentation/controllers/category_controller.dart';
import 'package:lady_first_flutter/features/notification/controllers/notification_controller.dart';
import 'package:lady_first_flutter/features/notification/data/repositories/notification_repository.dart';
import 'package:lady_first_flutter/features/product/data/repositories/product_repository.dart';
import 'package:lady_first_flutter/features/product/presentation/controllers/product_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  Get.put(await SharedPreferences.getInstance(), permanent: true);

  // * For APi------------------------------------------------------------>
  Get.put(
    ApiClient(
      appBaseUrl: AppConst.BASE_URL,
      sharedPreferences: Get.find<SharedPreferences>(),
    ),
    permanent: true,
  );

  // * For Repositories --------------------------------------------------->
  final ApiClient apiClient = Get.find<ApiClient>();
  Get.put(ProductRepository(apiClient: apiClient), permanent: true);
  Get.put(CategoryRepository(apiClient: apiClient), permanent: true);
  Get.put(NotificationRepository(apiClient: apiClient), permanent: true);

  // * For Controllers --------------------------------------------------->
  Get.put(NotificationController(), permanent: true);
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => CategoryController());
}
