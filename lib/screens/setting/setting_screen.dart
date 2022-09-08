import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          title: const Text(
            'Settings',
            style: TextStyle(color: blackColor),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.square(0),
            child: Container(
              color: pinkColor,
              height: 1.0,
            ),
          ),
          elevation: 0),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
        child: ListView.builder(
          itemBuilder: (context, index) => buildSettingMenu(index),
          itemCount: menuSettings.length,
        ),
      ),
    );
  }
}

Widget buildSettingMenu(int i) {
  return GestureDetector(
    onTap: () => {},
    child: Container(
      height: 50,
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(menuSettings[i].icon),
                onPressed: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                menuSettings[i].title,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          Visibility(
            visible: menuSettings[i].hasChild,
            child: Row(
              children: [
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: grayColor,
                    ))
              ],
            ),
          )
        ],
      ),
    ),
  );
}
