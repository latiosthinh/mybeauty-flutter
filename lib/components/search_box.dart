import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/constants.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Color backgroundColor;
  const SearchBox(
      {Key? key, required this.onChanged, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60.0, right: 60.0),
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: backgroundColor,
        ),
        color: backgroundColor,
      ),
      height: 36.0,
      alignment: Alignment.bottomCenter,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: "Find a treatment or venue",
          hintStyle: const TextStyle(color: whiteColor),
        ),
      ),
    );
  }
}
