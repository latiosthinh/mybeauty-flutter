import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

class SettingScreen extends StatefulWidget {
  static String routeName = "/setting";
  const SettingScreen({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

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
          preferredSize: const Size.square(1),
          child: Container(
            color: pinkColor,
            height: 4.0,
          ),
        ),
        shadowColor: whiteColor,
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
