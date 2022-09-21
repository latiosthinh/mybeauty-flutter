import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/setting.dart';

class TermScreen extends StatefulWidget {
  static String routeName = "/term";
  const TermScreen({Key? key}) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: listTerm.map((term) => buildTerm(term)).toList(),
          )),
    );
  }

  Widget buildTerm(String text) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18.0),
          ),
          const Icon(
            Icons.arrow_forward,
            color: grayColor,
          )
        ],
      ),
    );
  }
}
