import 'package:flutter/material.dart';

class CustomTextFeildGenrator extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomTextFeildGenrator({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
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
