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
                Material(
                    color: whiteColor,
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/logo.svg",
                            color: MenuState.myNails == selectedMenu
                                ? pinkColor
                                : inActiveIconColor,
                            width: 30,
                            height: 25,
                          ),
                          Text(
                            'MyNails',
                            style: GoogleFonts.metamorphous(
                                color: MenuState.myNails == selectedMenu
                                    ? darkPinkColor
                                    : inActiveIconColor,
                                height: 1.2,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      onTap: () =>
                          {Navigator.pushNamed(context, NailScreen.routeName)},
                    )),
                Material(
                    color: whiteColor,
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/logo.svg",
                            color: MenuState.myBeauty == selectedMenu
                                ? greenColor
                                : inActiveIconColor,
                            width: 30,
                            height: 25,
                          ),
                          Text(
                            'MyBeauty',
                            style: GoogleFonts.metamorphous(
                                color: MenuState.myBeauty == selectedMenu
                                    ? greenColor
                                    : inActiveIconColor,
                                height: 1.2,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      onTap: () => {
                        Navigator.pushNamed(context, BeautyScreen.routeName)
                      },
                    )),
                Material(
                    color: whiteColor,
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/setting.svg",
                            color: MenuState.setting == selectedMenu
                                ? yellorColor
                                : inActiveIconColor,
                            width: 30,
                            height: 25,
                          ),
                          Text(
                            'Setting',
                            style: GoogleFonts.robotoCondensed(
                                color: MenuState.setting == selectedMenu
                                    ? yellorColor
                                    : inActiveIconColor,
                                height: 1.2,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      onTap: () => {
                        Navigator.pushNamed(context, SettingScreen.routeName)
                      },
                    )),
                Material(
                    color: whiteColor,
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/calendar.svg",
                            color: MenuState.booking == selectedMenu
                                ? yellorColor
                                : inActiveIconColor,
                            width: 30,
                            height: 25,
                          ),
                          Text(
                            'Bookings',
                            style: GoogleFonts.robotoCondensed(
                                color: MenuState.booking == selectedMenu
                                    ? yellorColor
                                    : inActiveIconColor,
                                height: 1.2,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      onTap: () => {
                        Navigator.pushNamed(context, BookingScreen.routeName)
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
