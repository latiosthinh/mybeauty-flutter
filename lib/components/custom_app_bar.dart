import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class CustomAppBarFullNavBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(160);

  const CustomAppBarFullNavBar(
      {Key? key, required this.logo, required this.color})
      : super(key: key);

  final String logo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 20),
            height: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(color: yellorColor, width: 1.0))),
            child: Column(
              children: [
                SvgPicture.asset(
                  logo,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: color),
                  margin: const EdgeInsets.only(
                      top: 18, left: 60, right: 60, bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 36.0,
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        Text(
                          'Find a treatment or venue',
                          style: GoogleFonts.robotoCondensed(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
