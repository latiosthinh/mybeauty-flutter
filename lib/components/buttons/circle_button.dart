import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color bgColor;
  final String text;
  final Function onTap;
  final Color foreColor;
  const CircleButton(
      {Key? key,
      required this.bgColor,
      required this.text,
      required this.onTap,
      required this.foreColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: bgColor,
        child: InkWell(
          onTap: () => onTap(),
          child: SizedBox(
            height: 28,
            width: 28,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.6, color: foreColor),
            ),
          ),
        ),
      ),
    );
  }
}
