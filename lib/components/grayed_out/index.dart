import 'package:flutter/material.dart';

class GrayedOut extends StatelessWidget {
  final Widget child;
  final bool grayedOut;

  const GrayedOut(this.child, {Key? key, this.grayedOut = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return grayedOut
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.saturation,
            ),
            child: child)
        : child;
  }
}
