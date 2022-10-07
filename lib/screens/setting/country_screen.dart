import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/data/index.dart';
import 'package:mybeauty/data/models/index.dart';
import 'package:mybeauty/widgets/index.dart';

class CountryScreen extends StatefulWidget {
  static String routeName = "/country";
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late CountryHive selected;
  final LocalDataStorage _db = LocalDataStorage();
  final languages = LocalDataStorage.initLanguage();

  @override
  void initState() {
    selected = _db.getActiveLanguage();
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
          itemCount: languages.length,
        ),
      ),
    );
  }

  Widget buildSettingMenu(int i) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          selected = languages[i];
          _db.setActiveLanguage(selected);
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
                  icon: Image.asset(languages[i].flag),
                  onPressed: () {},
                ),
                const HSpacer(10),
                Text(
                  languages[i].name,
                  style: const TextStyle(fontSize: 18.0, color: orangeColor),
                ),
              ],
            ),
            Visibility(
              visible: languages[i].code == selected.code,
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
