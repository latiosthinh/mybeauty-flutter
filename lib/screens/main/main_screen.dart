import 'package:flutter/material.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/screens/index.dart';

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
              child: ButtonCTA(
                  onTap: () =>
                      {Navigator.pushNamed(context, NailScreen.routeName)},
                  text: 'Nails',
                  bgColor: darkPinkColor),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg-beauty.png'),
                        fit: BoxFit.cover)),
                child: ButtonCTA(
                    onTap: () =>
                        {Navigator.pushNamed(context, BeautyScreen.routeName)},
                    text: 'Beauty',
                    bgColor: greenColor),
              ))
        ],
      )),
    );
  }
}
