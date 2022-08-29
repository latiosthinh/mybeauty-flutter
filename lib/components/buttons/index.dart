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

Widget backButton(Color bgColor, Color iconColor, Function onTab,
    [bool hasBgColor = true]) {
  return Material(
    borderRadius: BorderRadius.circular(8.0),
    color: hasBgColor ? bgColor : Colors.transparent,
    child: InkWell(
      onTap: () => onTab(),
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

Widget addSuffixIconButton(Function onTap) {
  return ClipOval(
    child: InkWell(
      onTap: () => onTap(),
      child: const SizedBox(
        height: 17,
        width: 17,
        child: Icon(
          Icons.add,
          size: 16,
          color: greenColor,
        ),
      ),
    ),
  );
}
