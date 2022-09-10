import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/search_box.dart';
import '../constants.dart';

class CustomAppBarFullNavBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(160);

  const CustomAppBarFullNavBar(
      {Key? key,
      required this.logo,
      required this.color,
      required this.inputColor})
      : super(key: key);

  final String logo;
  final Color color;
  final Color inputColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 160,
              flexibleSpace: Container(
                  padding: const EdgeInsets.only(top: 16),
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(color: orangeColor, width: 1.0))),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/logo.svg',
                              color: color,
                              width: 36,
                              height: 30,
                            ),
                            Text(
                              logo,
                              style: GoogleFonts.podkova(
                                  fontSize: 32, color: color),
                            )
                          ],
                        ),
                      ),
                      SearchBox(
                        backgroundColor: inputColor,
                        onChanged: (value) => {},
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
