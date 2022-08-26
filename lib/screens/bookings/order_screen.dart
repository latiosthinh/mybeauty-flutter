import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/back_button.dart';
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
            padding:
                const EdgeInsets.only(top: 30, right: 38, left: 38, bottom: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: backButton(greenColor, whiteColor)),
                Container(
                  margin: const EdgeInsets.only(bottom: 9.0),
                  child: Text(
                    'Eyebrow',
                    style: GoogleFonts.robotoCondensed(
                        color: greenColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0),
                  ),
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
            height: 2,
          ),
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        child: Row(
                          children: const [Icon(Icons.schedule), Text('Time')],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: grayColor)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
