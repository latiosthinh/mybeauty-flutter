import 'package:flutter/material.dart';
import 'package:mybeauty/components/buttons/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/screens/beauty/beauty_screen.dart';
import 'package:mybeauty/screens/nails/nail_screen.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/home";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg-nails.png'),
                      fit: BoxFit.cover)),
              child: buttonCTA(
                  () => {Navigator.pushNamed(context, NailScreen.routeName)},
                  'Nails',
                  darkPinkColor),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg-beauty.png'),
                        fit: BoxFit.cover)),
                child: buttonCTA(
                    () =>
                        {Navigator.pushNamed(context, BeautyScreen.routeName)},
                    'Beauty',
                    greenColor),
              ))
        ],
      )),
    );
  }
}
