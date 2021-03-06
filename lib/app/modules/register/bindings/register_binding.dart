import 'package:get/get.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';
import 'package:shopify_admin/app/modules/home/controllers/home_controller.dart';
import 'package:shopify_admin/app/modules/login/controllers/login_controller.dart';

import 'package:shopify_admin/app/modules/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<FirebaseAuthenticationService>(
      () => FirebaseAuthenticationService(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
