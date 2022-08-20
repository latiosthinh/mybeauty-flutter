import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
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
                      //Navigator.pushNamed(context, HomeScreen.routeName),
                      {}),
              IconButton(
                icon: SvgPicture.asset("assets/icons/logo.svg",
                    color: MenuState.myBeauty == selectedMenu
                        ? darkPinkColor
                        : inActiveIconColor),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/setting.svg"),
                onPressed: () =>
                    {Navigator.pushNamed(context, SettingScreen.routeName)},
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/calendar.svg",
                    color: MenuState.bookings == selectedMenu
                        ? darkPinkColor
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      //Navigator.pushNamed(context, ProfileScreen.routeName),
                      {}),
            ],
          )),
    );
  }
}
