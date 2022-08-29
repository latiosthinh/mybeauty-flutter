import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/screens/beauty/beauty_screen.dart';
import 'package:mybeauty/screens/bookings/booking_screen.dart';
import 'package:mybeauty/screens/nails/nail_screen.dart';
import 'package:mybeauty/screens/setting/setting_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = grayColor;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: darkPinkColor, width: 1.0))),
      child: SafeArea(
          top: false,
          child: SizedBox(
            height: 80,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavIcon(
                    alignment: MainAxisAlignment.center,
                    svgPath: "assets/icons/logo.svg",
                    selectedMenu: MenuState.setting,
                    activeColor: pinkColor,
                    text: "MyNails",
                    tap: () =>
                        {Navigator.pushNamed(context, NailScreen.routeName)}),
                NavIcon(
                    alignment: MainAxisAlignment.center,
                    svgPath: "assets/icons/logo.svg",
                    selectedMenu: MenuState.myBeauty,
                    activeColor: greenColor,
                    text: "MyBeauty",
                    tap: () =>
                        {Navigator.pushNamed(context, BeautyScreen.routeName)}),
                NavIcon(
                    alignment: MainAxisAlignment.center,
                    svgPath: "assets/icons/setting.svg",
                    selectedMenu: MenuState.setting,
                    activeColor: yellowColor,
                    text: "Settings",
                    tap: () => {
                          Navigator.pushNamed(context, SettingScreen.routeName)
                        }),
                NavIcon(
                    alignment: MainAxisAlignment.center,
                    svgPath: "assets/icons/calendar.svg",
                    selectedMenu: MenuState.booking,
                    activeColor: yellowColor,
                    text: "Bookings",
                    tap: () => {
                          Navigator.pushNamed(context, BookingScreen.routeName)
                        }),
              ],
            ),
          )),
    );
  }
}

class NavIcon extends StatelessWidget {
  final MainAxisAlignment? alignment;
  final String? svgPath;
  final MenuState? selectedMenu;
  final Color activeColor;
  final String text;
  final Function tap;

  const NavIcon(
      {Key? key,
      this.alignment,
      this.svgPath,
      this.selectedMenu,
      required this.activeColor,
      required this.text,
      required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: whiteColor,
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath!,
                color:
                    MenuState.setting == selectedMenu ? activeColor : grayColor,
                width: 30,
                height: 25,
              ),
              Text(
                text,
                style: GoogleFonts.robotoCondensed(
                    color: MenuState.setting == selectedMenu
                        ? activeColor
                        : grayColor,
                    height: 1.2,
                    fontSize: 12),
              ),
            ],
          ),
          onTap: () => tap(),
        ));
  }
}
