import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/data/index.dart';
import 'package:mybeauty/data/models/index.dart';
import 'package:mybeauty/models/setting.dart';

class ContentPreferenceScreen extends StatefulWidget {
  static String routeName = "/content-preference";
  const ContentPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<ContentPreferenceScreen> createState() => _ContentPreferenceState();
}

class _ContentPreferenceState extends State<ContentPreferenceScreen> {
  ContentPreference _radioValue = listContentPreference[0];
  final LocalDataStorage _db = LocalDataStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        bottom: PreferredSize(
          preferredSize: const Size.square(1),
          child: Container(
            color: pinkColor,
            height: 1.0,
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children:
                listContentPreference.map((item) => buildItem(item)).toList(),
          )),
    );
  }

  Widget buildItem(ContentPreference item) {
    return ListTile(
      title: Text(
        item.name,
        style: const TextStyle(color: orangeColor, fontSize: 18.0),
      ),
      leading: Radio<ContentPreference>(
        onChanged: ((ContentPreference? value) => {
              setState(() {
                _radioValue = value ?? listContentPreference[0];
                final content = ContentHive();
                content.id = _radioValue.key;
                content.name = _radioValue.name;
                _db.setActiveContent(content);
              })
            }),
        groupValue: _radioValue,
        value: item,
      ),
    );
  }
}
