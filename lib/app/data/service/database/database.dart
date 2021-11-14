import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DataBase {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('productData');

  var uuid = const Uuid();

  uploadTheProduct(
      {required String productName,
      required String productDescription,
      required double productPrice,
      required String productImage,
      required String productId}) async {
    Map<String, dynamic> productData = {
      'productName': productName,
      'productDiscription': productDescription,
      'productPrice': productPrice,
      'productImage': productImage,
      'productId': uuid.v4(),
    };

    try {
      await collectionReference.doc(uuid.v1()).set(productData);

      Get.snackbar(
        "Success!",
        "Data Uploaded!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        isDismissible: true,
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error!",
        "Please Try Again!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        isDismissible: true,
      );
    }
  }
}
