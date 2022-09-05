import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final Color background;
  final IconData? icon;
  final String text;
  final Function login;

  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.background,
      this.icon,
      required this.login})
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
          onPressed: () => login(),
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: background,
              primary: color),
          label: Text(
            text,
            style: GoogleFonts.robotoCondensed(),
          ),
        ));
  }
}