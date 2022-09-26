import 'package:flutter/cupertino.dart';

class Jumbotron extends StatelessWidget {
  final Color color;
  final String customText;
  const Jumbotron({Key? key, required this.color, required this.customText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                image: AssetImage('assets/images/spoil-someone.png'),
                fit: BoxFit.cover)),
        margin: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 30),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SPOIL SOMEONE',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text('The $customText gift card is the perfect beauty treat')
            ],
          ),
        ));
  }
}
