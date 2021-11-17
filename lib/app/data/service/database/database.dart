import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DataBase {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('productData');

  FirebaseStorage storage = FirebaseStorage.instance;

  FirebaseAuth auth = FirebaseAuth.instance;

  var uuid = const Uuid();

  String productImageUrl = '';

  uploadTheProduct({
    required String productName,
    required String productDescription,
    required double productPrice,
    required String productImage,
    required String productId,
  }) async {
    Map<String, dynamic> productData = {
      'productName': productName,
      'productDiscription': productDescription,
      'productPrice': productPrice,
      'productImage': productImage,
      'productId': uuid.v4(),
    };

    try {
      await collectionReference.add(productData);

      Get.snackbar(
        "Success!",
        "Data Uploaded!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        isDismissible: true,
      );
    } catch (e) {
      // print(e);
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

  // uploadProductImage({required File file}) async {
  //   var snapshot =
  //       await storage.ref().child('images/${file.path}').putFile(file);

  //   var downloadUrl = await snapshot.ref.getDownloadURL();

  //   productImageUrl = downloadUrl;
  // }
}
