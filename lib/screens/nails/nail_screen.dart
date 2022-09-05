import 'package:flutter/material.dart';
import 'package:mybeauty/components/custom_bottom_nav_bar.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/components/jumbotron.dart';
import 'package:mybeauty/components/service_list.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

class NailScreen extends StatefulWidget {
  static String routeName = "/nails";
  const NailScreen({Key? key}) : super(key: key);

  @override
  State<NailScreen> createState() => _NailScreenState();
}

class _NailScreenState extends State<NailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBarFullNavBar(
          logo: 'MY NAILS',
          color: darkPinkColor,
          inputColor: pinkColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [jumbotron(pinkOpacityColor)],
            ),
        )),
    ));
  }
}
