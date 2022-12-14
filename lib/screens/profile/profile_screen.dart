import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        buildListItem('Avatar'),
        buildListItem('Name'),
        buildListItem('Mail'),
        buildListItem('Phone'),
        buildListItem('Birth')
      ],
    ));
  }

  buildListItem(String label) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: darkPinkColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: darkPinkColor),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.edit_outlined),
            iconSize: 16,
          )
        ],
      ),
    );
  }
}
