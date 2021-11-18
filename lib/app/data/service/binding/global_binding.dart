import 'package:get/get.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';
import 'package:shopify_admin/app/modules/entry/controllers/entry_controller.dart';
import 'package:shopify_admin/app/modules/home/controllers/home_controller.dart';
import 'package:shopify_admin/app/modules/login/controllers/login_controller.dart';
import 'package:shopify_admin/app/modules/register/controllers/register_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(
      () => EntryController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<FirebaseAuthenticationService>(
      () => FirebaseAuthenticationService(),
    );
  }
}
