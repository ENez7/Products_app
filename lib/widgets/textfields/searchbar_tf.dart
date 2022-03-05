import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTF extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  const CustomTF({
    required this.controller,
    this.hintText,
    this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 1),
      child: TextField(
        controller: controller,
        // maxLines: 3,
        // maxLength: 20,
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          labelText: labelText,
        ),
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
