import 'package:get/get.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';

import 'package:shopify_admin/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FirebaseAuthenticationService>(
      () => FirebaseAuthenticationService(),
    );
  }
}
