import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/screens/main/main_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushNamed(context, MainScreen.routeName);
    // });

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: pinkColor,
      child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, MainScreen.routeName),
          child: Center(
            child: SvgPicture.asset('assets/images/full-logo.svg'),
          )),
    ));
  }
}
