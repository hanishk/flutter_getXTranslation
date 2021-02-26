import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;
  CustomText(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text.tr,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
