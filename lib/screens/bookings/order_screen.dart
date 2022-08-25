import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

class OrderScreen extends StatefulWidget {
  static String routeName = "/order";
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: greenColor, primary: whiteColor),
                    onPressed: (() => {}),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Text(
                  'Eyebrow',
                  style: GoogleFonts.robotoCondensed(
                      color: greenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: greenColor,
                    ),
                    Text(
                      '306 St Paul\'s Road London N12LH',
                      style: GoogleFonts.robotoCondensed(color: greenColor),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: pinkColor,
          )
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
