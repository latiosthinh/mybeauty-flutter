import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/widgets/index.dart';

class ImportBooking extends StatefulWidget {
  static String routeName = "/import-booking";
  const ImportBooking({Key? key}) : super(key: key);

  @override
  State<ImportBooking> createState() => _ImportBookingState();
}

class _ImportBookingState extends State<ImportBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Import my booking',
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
        margin: const EdgeInsets.all(38.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: pinkColor, width: 1.0))),
                  ),
                  const VSpacer(18),
                  const Text(
                    'Enter the email you used to make your booking',
                    style: TextStyle(color: grayColor),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 38,
              child: TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: grayColor,
                    primary: blackColor),
                child: const Text('Create your account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
