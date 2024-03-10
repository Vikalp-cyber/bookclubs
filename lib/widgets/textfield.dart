import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String title;
  TextEditingController controller;
  Icon icon;
  CustomTextField(this.title, this.controller, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: title,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
