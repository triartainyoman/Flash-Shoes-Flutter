import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';

class InputField extends StatelessWidget {
  InputField({
    @required this.obscureText,
    this.controller,
    this.type,
    this.validator,
  });

  final bool obscureText;
  final TextInputType type;
  final TextEditingController controller;
  final Function validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: type,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
        ),
        style: kInputTextStyle,
      ),
    );
  }
}
