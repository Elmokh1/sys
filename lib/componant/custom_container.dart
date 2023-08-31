import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  String text;

  CustomContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xfffaecc6),
      ),
      child: Center(child: Text(text)),
    );
  }
}
