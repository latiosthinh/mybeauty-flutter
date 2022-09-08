import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget jumbotron(Color color) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
              image: AssetImage('assets/images/spoil-someone.png'),
              fit: BoxFit.cover)),
      margin: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 30),
      child: Container(
        height: 70,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SPOIL SOMEONE',
              style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.w700),
            ),
            Text('The MyNails gift card is the perfect beauty treat',
                style: GoogleFonts.robotoCondensed())
          ],
        ),
      ));
}
