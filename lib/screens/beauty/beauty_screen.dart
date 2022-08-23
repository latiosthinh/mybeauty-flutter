import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

class BeautyScreen extends StatefulWidget {
  static String routeName = "/beauty";
  const BeautyScreen({Key? key}) : super(key: key);

  @override
  State<BeautyScreen> createState() => _BeautyScreenState();
}

class _BeautyScreenState extends State<BeautyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarFullNavBar(
        logo: 'assets/images/mybeauty-logo.svg',
        color: lightGreenColor,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/spoil-someone.png'),
                        fit: BoxFit.cover)),
                margin: const EdgeInsets.only(top: 16),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: lightGreenOpacityColor),
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
                )),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'Browse treatments',
                style: GoogleFonts.robotoCondensed(fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.myBeauty),
    );
  }
}
