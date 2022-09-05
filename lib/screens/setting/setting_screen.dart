import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/custom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';
import 'package:mybeauty/models/setting.dart';

class SettingScreen extends StatefulWidget {
  static String routeName = "/setting";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'Settings',
          style: GoogleFonts.robotoCondensed(color: blackColor),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.square(0),
          child: Container(
            color: pinkColor,
            height: 1.0,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) => buildSettingMenu(index),
        itemCount: menuSettings.length,
      )),
    ));
  }
}

Widget buildSettingMenu(int i) {
  return GestureDetector(
    onTap: () => {},
    child: Container(
      height: 50,
      color: whiteColor,
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(menuSettings[i].icon),
            onPressed: () {},
          ),
          Text(
            menuSettings[i].title,
            style: GoogleFonts.robotoCondensed(),
          ),
        ],
      ),
    ),
  );
}
