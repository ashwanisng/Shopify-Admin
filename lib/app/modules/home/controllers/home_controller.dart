// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify_admin/app/data/service/database/database.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  var selectImagePath = ''.obs;

  getImage(ImageSource imageSource) async {
    var pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectImagePath.value = pickedFile.path;
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
  }

  DataBase db = DataBase();

  uploadData() async {
    await db.uploadTheProduct(
      productName: productNameController.text,
      productPrice: double.parse(productPriceController.text),
      productDescription: productDescriptionController.text,
      productImage: selectImagePath.value,
      productId: productIdController.text,
    );
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
