import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/data/index.dart';
import 'package:mybeauty/data/models/index.dart';
import 'package:mybeauty/models/setting.dart';
import 'package:mybeauty/widgets/index.dart';

class CountryScreen extends StatefulWidget {
  static String routeName = "/country";
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late Country selected;
  final LocalDataStorage _db = LocalDataStorage();

  @override
  void initState() {
    selected = listCountry
        .where((element) => element.code == _db.getActiveLanguage()?.code)
        .first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
        bottom: PreferredSize(
          preferredSize: const Size.square(0),
          child: Container(
            color: pinkColor,
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
        child: ListView.builder(
          itemBuilder: (context, index) => buildSettingMenu(index),
          itemCount: listCountry.length,
        ),
      ),
    );
  }

  Widget buildSettingMenu(int i) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          selected = listCountry[i];
          final country = CountryHive();
          country.active = true;
          country.code = selected.code;
          country.flag = selected.icon;
          country.name = selected.name;
          _db.setActiveLanguage(country);
        })
      },
      child: Container(
        height: 50,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Image.asset(listCountry[i].icon),
                  onPressed: () {},
                ),
                const HSpacer(10),
                Text(
                  listCountry[i].name,
                  style: const TextStyle(fontSize: 18.0, color: orangeColor),
                ),
              ],
            ),
            Visibility(
              visible: listCountry[i] == selected,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.check,
                        color: orangeColor,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
