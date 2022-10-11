import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final Color background;
  final IconData? icon;
  final String text;
  final Function func;

  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.background,
      this.icon,
      required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 38,
        child: ElevatedButton.icon(
          icon: Icon(
            icon,
            size: 18,
          ),
          onPressed: () => func(),
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: background,
              primary: color),
          label: Text(
            text,
          ),
        ));
  }
}
