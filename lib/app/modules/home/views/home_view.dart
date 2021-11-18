// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify_admin/app/core/enviroment/env.dart';

import 'package:shopify_admin/app/modules/home/controllers/home_controller.dart';
import 'package:shopify_admin/app/modules/home/views/components/custom_button.dart';
import 'package:shopify_admin/app/modules/home/views/components/text_feild.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Shopify Admin',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            onPressed: () {
              controller.authService.signOut();
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.getImage(ImageSource.gallery);
                    },
                    child: Obx(
                      () => Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: double.infinity,
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: controller.selectImagePath.value.isEmpty
                            ? Image.asset(
                                'assets/images/img.jpg',
                                // 'https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
                                fit: BoxFit.fitWidth,
                              )
                            : Image.file(
                                File(controller.selectImagePath.value),
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      CustomTextFeildGenrator(
                        controller: controller.productNameController,
                        hintText: 'Product Name',
                        keyboardType: TextInputType.text,
                        maxLength: 1,
                      ),
                      const SizedBox(height: 8),
                      CustomTextFeildGenrator(
                        controller: controller.productDescriptionController,
                        hintText: 'Product Description',
                        keyboardType: TextInputType.text,
                        maxLength: 4,
                      ),
                      const SizedBox(height: 8),
                      CustomTextFeildGenrator(
                        controller: controller.productPriceController,
                        hintText: 'Product Price',
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        buttonText: "Update Data",
                        onPressed: () {
                          controller.uploadData();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
