import 'package:flutter/material.dart';

class GrayedOut extends StatelessWidget {
  final Widget child;
  final bool grayedOut;

  const GrayedOut(this.child, {Key? key, this.grayedOut = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return grayedOut
        ? Container(
            foregroundDecoration: BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
                borderRadius: BorderRadius.circular(10.0)),
            child: child)
        : child;
  }
}
