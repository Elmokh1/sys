import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String Label;
  TextEditingController controller;
  MyValidator validator;
  bool isPassword;

  CustomTextFormField(
      {required this.Label,
      this.isPassword = false,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text("$Label"),
      ),
    );
  }
}
