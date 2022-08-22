import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'Log in with MyNails account',
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
        margin: const EdgeInsets.only(left: 38, right: 38, top: 38),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 38,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.apple,
                  size: 18,
                ),
                onPressed: () => {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: pinkColor,
                    primary: blackColor),
                label: Text(
                  'Sign in with Apple',
                  style: GoogleFonts.robotoCondensed(),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 9, bottom: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.facebook,
                      size: 18,
                    ),
                    onPressed: () => {},
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: blueColor,
                        primary: whiteColor),
                    label: Text(
                      'Continue with Facebook',
                      style: GoogleFonts.robotoCondensed(),
                    ),
                  ),
                )),
            Center(
              child: Text(
                'or use your email',
                style: GoogleFonts.robotoCondensed(fontSize: 18.0),
              ),
            ),
            Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: pinkColor, width: 1.0)),
                    labelText: 'Email'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: pinkColor, width: 1.0))),
                style: GoogleFonts.robotoCondensed(),
              )
            ]),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 28.0),
              child: Text(
                'Forgot your password?',
                style: GoogleFonts.robotoCondensed(color: redColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 21, bottom: 13),
              child: SizedBox(
                width: double.infinity,
                height: 38,
                child: TextButton(
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: grayColor,
                      primary: whiteColor),
                  child: Text(
                    'Log in',
                    style: GoogleFonts.robotoCondensed(),
                  ),
                ),
              ),
            ),
            Text(
              'By continuing you agree to our Terms & Conditions',
              style: GoogleFonts.robotoCondensed(fontSize: 9, color: grayColor),
            )
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
