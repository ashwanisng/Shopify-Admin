// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFeildGenrator extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  int? maxLength;

  CustomTextFeildGenrator({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLength,
      decoration: InputDecoration(
        fillColor: const Color(0xffe7edeb),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
      ),
    );
  }
}
