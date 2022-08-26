import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget backButton(Color bgColor, Color iconColor, [bool hasBgColor = true]) {
  return Material(
    borderRadius: BorderRadius.circular(8.0),
    color: hasBgColor ? bgColor : Colors.transparent,
    child: InkWell(
      child: SizedBox(
        height: 36.0,
        width: 36.0,
        child: Icon(
          Icons.arrow_back,
          color: iconColor,
        ),
      ),
    ),
  );
}
