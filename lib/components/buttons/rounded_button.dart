import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final Function onTap;
  final bool hasBgColor;
  const RoundedButton({
    Key? key,
    required this.bgColor,
    required this.onTap,
    required this.iconColor,
    required this.hasBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: hasBgColor ? bgColor : Colors.transparent,
      child: InkWell(
        onTap: () => onTap(),
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
}
