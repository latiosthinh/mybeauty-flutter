import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/components/category/index.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/components/jumbotron.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/category.dart';
import 'package:mybeauty/screens/bookings/appointment_screen.dart';

class BeautyScreen extends StatefulWidget {
  static String routeName = "/beauty";
  const BeautyScreen({Key? key}) : super(key: key);

  @override
  State<BeautyScreen> createState() => _BeautyScreenState();
}

class _BeautyScreenState extends State<BeautyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarFullNavBar(
        logo: 'MY BEAUTY',
        color: greenColor,
        inputColor: lightGreenColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            jumbotron(lightGreenOpacityColor),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 12, bottom: 30),
              child: const Text(
                'Browse treatments',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
            ),
            CategoryComponent(
              color: greenColor,
              categories: beautyCategories,
            ),
          ],
        ),
      ),
    );
  }
}
