import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/screens/beauty/beauty_screen.dart';
import 'package:mybeauty/screens/bookings/booking_screen.dart';
import 'package:mybeauty/screens/nails/nail_screen.dart';
import 'package:mybeauty/screens/setting/setting_screen.dart';
import '../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> tap;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: darkPinkColor, width: 1.0))),
        height: 80,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                    width: 30,
                    height: 25,
                    child: SvgPicture.asset("assets/icons/logo.svg",
                        color: grayColor)),
                activeIcon: SizedBox(
                    width: 30,
                    height: 25,
                    child: SvgPicture.asset("assets/icons/logo.svg",
                        color: pinkColor)),
                label: "MyNails",
              ),
              BottomNavigationBarItem(
                icon: Container(
                    width: 30,
                    height: 25,
                    margin: const EdgeInsets.only(bottom: 3),
                    child: SvgPicture.asset("assets/icons/logo.svg",
                        color: grayColor)),
                activeIcon: Container(
                    width: 30,
                    height: 25,
                    margin: const EdgeInsets.only(bottom: 3),
                    child: SvgPicture.asset("assets/icons/logo.svg",
                        color: greenColor)),
                label: "MyBeauty",
              ),
              BottomNavigationBarItem(
                icon: Container(
                    width: 30,
                    height: 25,
                    margin: const EdgeInsets.only(bottom: 3),
                    child: SvgPicture.asset("assets/icons/setting.svg",
                        color: grayColor)),
                activeIcon: Container(
                    width: 30,
                    height: 25,
                    margin: const EdgeInsets.only(bottom: 3),
                    child: SvgPicture.asset("assets/icons/setting.svg",
                        color: greenColor)),
                label: "Settings",
              ),
              BottomNavigationBarItem(
                icon: Container(
                    width: 30,
                    height: 25,
                    margin: const EdgeInsets.only(bottom: 3),
                    child: SvgPicture.asset("assets/icons/calendar.svg",
                        color: grayColor)),
                activeIcon: Container(
                    width: 30,
                    height: 25,
                    margin: const EdgeInsets.only(bottom: 3),
                    child: SvgPicture.asset("assets/icons/calendar.svg",
                        color: greenColor)),
                label: "Bookings",
              ),
            ],
            currentIndex: selectedIndex,
            onTap: tap,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.black,
            selectedFontSize: 12));
  }
}
