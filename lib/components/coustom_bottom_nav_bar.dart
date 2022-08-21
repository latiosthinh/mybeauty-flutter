import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: darkPinkColor, width: 1.0))),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/logo.svg",
                    color: MenuState.myNails == selectedMenu
                        ? darkPinkColor
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      {Navigator.pushNamed(context, NailScreen.routeName)}),
              IconButton(
                icon: SvgPicture.asset("assets/icons/logo.svg",
                    color: MenuState.myBeauty == selectedMenu
                        ? greenColor
                        : inActiveIconColor),
                onPressed: () =>
                    {Navigator.pushNamed(context, BeautyScreen.routeName)},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/setting.svg",
                    color: MenuState.setting == selectedMenu
                        ? yellorColor
                        : inActiveIconColor),
                onPressed: () =>
                    {Navigator.pushNamed(context, SettingScreen.routeName)},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/calendar.svg",
                  color: MenuState.booking == selectedMenu
                      ? yellorColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, BookingScreen.routeName),
              ),
            ],
          )),
    );
  }
}
