import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/setting.dart';

class ContentPreferenceScreen extends StatefulWidget {
  static String routeName = "/content-preference";
  const ContentPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<ContentPreferenceScreen> createState() => _ContentPreferenceState();
}

class _ContentPreferenceState extends State<ContentPreferenceScreen> {
  String _config = 'All';

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

  Widget buildItem(String text) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: orangeColor, fontSize: 18.0),
      ),
      leading: Radio<String>(
        onChanged: ((String? value) => {
              setState(() {
                _config = value ?? 'All';
              })
            }),
        groupValue: _config,
        value: text,
      ),
    );
  }
}
