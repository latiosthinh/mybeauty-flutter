import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: whiteColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: appBarTheme(),
      textTheme: textTheme());
}

TextTheme textTheme() {
  return GoogleFonts.robotoCondensedTextTheme();
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      centerTitle: true,
      backgroundColor: whiteColor,
      titleTextStyle: TextStyle(color: blackColor, fontSize: 18.0),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0);
}
