import 'package:flutter/material.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          'MyNails',
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
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: pinkColor, borderRadius: BorderRadius.circular(5)),
                height: 73,
                margin: const EdgeInsets.only(top: 16, right: 12, left: 12),
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
                ))
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.myNails),
    );
  }
}
