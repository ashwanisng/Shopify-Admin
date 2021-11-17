// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController =
      TextEditingController(text: "admin@shopify.com");

  TextEditingController passwordController =
      TextEditingController(text: "admin@123");

  FirebaseAuthenticationService authService =
      Get.find<FirebaseAuthenticationService>();

  RxBool isVisible = true.obs;

  void tooglePassword() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
