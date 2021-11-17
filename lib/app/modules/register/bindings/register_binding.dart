import 'package:get/get.dart';
import 'package:shopify_admin/app/modules/login/controllers/login_controller.dart';

import 'package:shopify_admin/app/modules/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
