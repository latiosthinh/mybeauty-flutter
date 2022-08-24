import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

class NailScreen extends StatefulWidget {
  static String routeName = "/nails";
  const NailScreen({Key? key}) : super(key: key);

  @override
  State<NailScreen> createState() => _NailScreenState();
}

class _NailScreenState extends State<NailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarFullNavBar(
        logo: 'MY NAILS',
        color: darkPinkColor,
        inputColor: pinkColor,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/spoil-someone.png'),
                        fit: BoxFit.cover)),
                margin: const EdgeInsets.only(top: 16, right: 12, left: 12),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: pinkOpacityColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SPOIL SOMEONE',
                        style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.w700),
                      ),
                      Text('The MyNails gift card is the perfect beauty treat',
                          style: GoogleFonts.robotoCondensed())
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.myNails),
    );
  }
}
