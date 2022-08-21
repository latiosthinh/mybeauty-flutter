import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

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
          'Setting',
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
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListView(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: 50,
                    color: whiteColor,
                    child: Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                              "assets/icons/exclamation-circle.svg"),
                          onPressed: () {},
                        ),
                        const Text('Feedback and support'),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: whiteColor,
                    child: Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset("assets/icons/legal.svg"),
                          onPressed: () {},
                        ),
                        const Text('Legal'),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: whiteColor,
                    child: Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset("assets/icons/country.svg"),
                          onPressed: () {},
                        ),
                        const Text('Country'),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: whiteColor,
                    child: Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset("assets/icons/users.svg"),
                          onPressed: () {},
                        ),
                        const Text('Content preference'),
                      ],
                    ),
                  ),
                ])
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.setting),
    );
  }
}
