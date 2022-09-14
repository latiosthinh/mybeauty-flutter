import 'package:flutter/material.dart';
import 'package:mybeauty/components/category/index.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/components/jumbotron.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/category.dart';

class NailScreen extends StatefulWidget {
  static String routeName = "/nails";
  const NailScreen({Key? key}) : super(key: key);

  @override
  State<NailScreen> createState() => _NailScreenState();
}

class _NailScreenState extends State<NailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarFullNavBar(
        logo: 'MY NAILS',
        color: darkPinkColor,
        inputColor: pinkColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            jumbotron(pinkOpacityColor),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 30, left: 12),
              child: const Text(
                'Browse treatments',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
            ),
            CategoryComponent(
              color: darkPinkColor,
              categories: nailCategories,
              type: 2,
            )
          ],
        ),
      ),
    );
  }
}
