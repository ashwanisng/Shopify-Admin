import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin/app/modules/home/views/home_view.dart';

class FirebaseAuthenticationService extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  var isLogin = false.obs;

  registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      isLogin.value = true;

      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        return Get.offAll(() => HomeView());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        "Try Again",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    } finally {
      isLogin.value = false;
    }
  }

  siginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      isLogin.value = true;
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        // userData.write('isLoggedIn', true);
        return Get.offAll(() => HomeView());
      });
    } catch (e) {
      Get.snackbar(
        'Error login account',
        "Try Again",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    } finally {
      isLogin.value = false;
    }
  }
}
