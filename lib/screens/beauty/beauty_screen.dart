import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';
import 'package:mybeauty/models/category.dart';

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
        logo: 'MY BEAUTY',
        color: greenColor,
        inputColor: lightGreenColor,
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
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) => buildCategory(index),
                itemCount: beautyCategories.length,
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

Widget buildCategory(int i) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
            image: AssetImage('assets/images/threading.png'),
            fit: BoxFit.cover)),
    padding: const EdgeInsets.all(25.0),
    margin: const EdgeInsets.only(bottom: 20.0),
    child: Center(
      child: TextButton(
        onPressed: () => {},
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: greenColor,
            primary: blackColor,
            padding: const EdgeInsets.all(10.0)),
        child: Text(
          beautyCategories[i].name,
          style: GoogleFonts.robotoCondensed(
              fontSize: 20.0, color: whiteColor, fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}
