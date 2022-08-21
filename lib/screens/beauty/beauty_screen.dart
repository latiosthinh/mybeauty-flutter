import 'package:flutter/material.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

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
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          'MyBeauty',
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
      body: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: lightGreenColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 73,
                margin: const EdgeInsets.only(top: 16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'SPOIL SOMEONE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('The MyNails gift card is the perfect beauty treat')
                    ],
                  ),
                )),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Browse treatments',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.myBeauty),
    );
  }
}
