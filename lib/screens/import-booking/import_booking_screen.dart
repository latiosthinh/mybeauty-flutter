import 'package:flutter/material.dart';
import 'package:mybeauty/components/custom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: whiteColor,
        title: Text(
          'Import my booking',
          style: GoogleFonts.robotoCondensed(fontSize: 18.0, color: blackColor),
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
                    style: GoogleFonts.robotoCondensed(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      'Enter the email you used to make your booking',
                      style: GoogleFonts.robotoCondensed(color: grayColor),
                      textAlign: TextAlign.left,
                    ),
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
                child: Text(
                  'Create your account',
                  style: GoogleFonts.robotoCondensed(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
