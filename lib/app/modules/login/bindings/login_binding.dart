import 'package:get/get.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';
import 'package:shopify_admin/app/modules/home/controllers/home_controller.dart';

import 'package:shopify_admin/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

    Get.lazyPut<FirebaseAuthenticationService>(
      () => FirebaseAuthenticationService(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
