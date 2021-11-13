import 'package:get/get.dart';

import 'package:shopify_admin/app/modules/home/bindings/home_binding.dart';
import 'package:shopify_admin/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
