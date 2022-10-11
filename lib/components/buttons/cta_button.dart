import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/constants.dart';

class ButtonCTA extends StatelessWidget {
  final Color bgColor;
  final String text;
  final Function onTap;
  const ButtonCTA(
      {Key? key,
      required this.bgColor,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 150,
      height: 150,
      child: Material(
          borderRadius: BorderRadius.circular(25.0),
          color: bgColor,
          child: InkWell(
            onTap: () => onTap(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My',
                  style: GoogleFonts.metamorphous(
                      fontSize: 24.0, color: whiteColor),
                ),
                Text(
                  text,
                  style: GoogleFonts.metamorphous(
                      fontSize: 24.0, color: whiteColor),
                )
              ],
            ),
          )),
    ));
  }
}
