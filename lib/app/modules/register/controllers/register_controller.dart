import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  TextEditingController emailController =
      TextEditingController(text: "admin@shopify.com");

  TextEditingController passwordController =
      TextEditingController(text: "admin@123");

  TextEditingController nameController = TextEditingController(text: "Admin");

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
