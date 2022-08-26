import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: whiteColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme());
}

TextTheme textTheme() {
  return GoogleFonts.robotoCondensedTextTheme();
}
