import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> tap;
  final List<Widget> screens;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.tap,
    required this.screens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
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
        activeColor: Colors.black,
        inactiveColor:Colors.white,
        border: const Border(top: BorderSide(color: darkPinkColor, width: 1.0)),
        height: 60,
        currentIndex: selectedIndex,
        onTap: tap
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return SafeArea(
                top: false,
                bottom: false,
                child: CupertinoApp(
                  home: CupertinoPageScaffold(
                    resizeToAvoidBottomInset: false,
                    child: screens[selectedIndex],
                  ),
                ),
              );
            },
          );
        });
  }
}
