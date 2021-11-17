// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  TextEditingController emailController =
      TextEditingController(text: "admin@shopify.com");

  TextEditingController passwordController =
      TextEditingController(text: "admin@123");

  TextEditingController nameController = TextEditingController(text: "Admin");

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
