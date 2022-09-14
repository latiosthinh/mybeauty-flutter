import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/screens/import-booking/import_booking_screen.dart';
import 'package:mybeauty/screens/login/login_screen.dart';
import 'package:mybeauty/screens/register/register_screen.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = "/booking";
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: const Text(
            'My Bookings',
            style: TextStyle(fontSize: 18.0, color: blackColor),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.square(0),
            child: Container(
              color: pinkColor,
              height: 1.0,
            ),
          ),
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 38, right: 38),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 22),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  color: orangeColor,
                  width: 61.03,
                  height: 68.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: const Center(
                child: Text('Your bookings will appear here',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
              ),
            ),
            const Center(
              child: Text(
                'If you’re looking for a booking you’ve made before, you can import and manage it here',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 71, top: 38),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, ImportBooking.routeName)},
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: orangeColor,
                      primary: blackColor),
                  child: const Text(
                    'Import my booking',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, LoginScreen.routeName)},
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            color: blackColor, fontWeight: FontWeight.w700),
                      )),
                  const Text('or'),
                  TextButton(
                      onPressed: () => {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName)
                          },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                            color: blackColor, fontWeight: FontWeight.w700),
                      ))
                ],
              )),
            )
          ]),
        ));
  }
}
