import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/constants.dart';

Widget buttonCTA(Function onTap, String name, Color bg) {
  return Center(
      child: SizedBox(
    width: 150,
    height: 150,
    child: Material(
        borderRadius: BorderRadius.circular(25.0),
        color: bg,
        child: InkWell(
          onTap: () => onTap(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My',
                style:
                    GoogleFonts.metamorphous(fontSize: 24.0, color: whiteColor),
              ),
              Text(
                name,
                style:
                    GoogleFonts.metamorphous(fontSize: 24.0, color: whiteColor),
              )
            ],
          ),
        )),
  ));
}
