import 'package:get/get.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';

import 'package:shopify_admin/app/modules/entry/controllers/entry_controller.dart';
import 'package:shopify_admin/app/modules/login/controllers/login_controller.dart';
import 'package:shopify_admin/app/modules/register/controllers/register_controller.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(
      () => EntryController(),
    );

    Get.lazyPut<RegisterController>(
      () => RegisterController(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );

    Get.lazyPut<FirebaseAuthenticationService>(
      () => FirebaseAuthenticationService(),
    );
  }
}
