// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopify_admin/app/data/service/auth/authentication.dart';
import 'package:shopify_admin/app/data/service/database/database.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  FirebaseAuthenticationService authService =
      Get.find<FirebaseAuthenticationService>();

  var selectImagePath = ''.obs;

  var downloadUrl = '';

  late File file;
  FirebaseStorage storage = FirebaseStorage.instance;

  getImage(ImageSource imageSource) async {
    var pickedFile = await ImagePicker().pickImage(source: imageSource);

    await Permission.photos.request();

    var checkPermission = await Permission.photos.status;

    if (checkPermission.isGranted) {
      selectImagePath.value = pickedFile!.path;

      if (pickedFile.path.isNotEmpty) {
        selectImagePath.value = pickedFile.path;

        file = File(selectImagePath.value);
//  upload image to firebase

        var snapshot = await storage
            .ref()
            .child('images/${pickedFile.name}')
            .putFile(file);

        downloadUrl = await snapshot.ref.getDownloadURL();

        Get.snackbar(
          'Success',
          'Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Image Not Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Permission Denied',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    }
  }

  DataBase db = DataBase();

  uploadData() async {
    await db.uploadTheProduct(
      productName: productNameController.text,
      productPrice: double.parse(productPriceController.text),
      productDescription: productDescriptionController.text,
      productImage: downloadUrl,
      productId: productIdController.text,
    );

    selectImagePath.value = '';

    productNameController.clear();
    productPriceController.clear();
    productDescriptionController.clear();
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
