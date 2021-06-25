import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.text, this.onTap, @required this.color});

  final String text;
  final Function onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0), color: color),
        child: Center(
          child: Text(
            text,
            style: kLabelTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
