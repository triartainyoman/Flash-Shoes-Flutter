import 'package:flash_shoes_flutter/constants.dart';
import 'package:flutter/material.dart';

class ReusableBackButton extends StatelessWidget {
  ReusableBackButton({@required this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: kPrimaryColor,
        ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }
}
