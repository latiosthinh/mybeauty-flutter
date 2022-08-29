import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/custom_bottom_nav_bar.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(38.0),
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
                      backgroundColor: blackColor,
                      primary: whiteColor),
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
                      labelText: 'Fullname'),
                ),
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
                          borderSide:
                              BorderSide(color: pinkColor, width: 1.0))),
                  style: GoogleFonts.robotoCondensed(),
                )
              ]),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 28.0),
                child: Text(
                  'Please enter at least 8 characters',
                  style: GoogleFonts.robotoCondensed(color: grayColor),
                ),
              ),
              CheckboxListTile(
                onChanged: (value) {},
                value: false,
                title: Text(
                  'Send me emails from MyNails with the latest offers & beauty news',
                  style: GoogleFonts.robotoCondensed(fontSize: 10.0),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.all(0),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: Text(
                  'You can find out more about how MyNails stores uses and protects your data in our privacy policy.',
                  style: GoogleFonts.robotoCondensed(fontSize: 10.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17, bottom: 13),
                child: SizedBox(
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
              ),
              Text(
                'By continuing you agree to our Terms & Conditions',
                style:
                    GoogleFonts.robotoCondensed(fontSize: 9, color: grayColor),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
