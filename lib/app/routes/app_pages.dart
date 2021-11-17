import 'package:get/get.dart';

import 'package:shopify_admin/app/modules/home/bindings/home_binding.dart';
import 'package:shopify_admin/app/modules/home/views/home_view.dart';
import 'package:shopify_admin/app/modules/login/bindings/login_binding.dart';
import 'package:shopify_admin/app/modules/login/views/login_view.dart';
import 'package:shopify_admin/app/modules/register/bindings/register_binding.dart';
import 'package:shopify_admin/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
