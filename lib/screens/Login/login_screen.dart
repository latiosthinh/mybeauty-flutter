import 'package:flutter/material.dart';
import 'package:mybeauty/screens/home.dart';
import 'package:mybeauty/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/components/primary_button.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading...');
          } else if (snapshot.hasError) {
            return const Text('error');
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: whiteColor,
                title: Text(
                  'Log in with MyNails account',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 18.0, color: blackColor),
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
                    Flexible(
                      child: PrimaryButton(
                        icon: Icons.apple,
                        background: blackColor,
                        color: whiteColor,
                        text: 'Sign in with Apple',
                        func: AuthService().anonymousLogin,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 9),
                      child: PrimaryButton(
                        icon: Icons.facebook,
                        background: blueColor,
                        color: whiteColor,
                        text: 'Sign in with Facebook',
                        func: AuthService().anonymousLogin,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 9, bottom: 40),
                      child: PrimaryButton(
                        icon: Icons.email,
                        background: whiteColor,
                        color: blackColor,
                        text: 'Sign in with Google',
                        func: AuthService().googleLogin,
                      ),
                    ),
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
                                borderSide:
                                    BorderSide(color: pinkColor, width: 1.0)),
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
                        'Forgot your password?',
                        style: GoogleFonts.robotoCondensed(color: redColor),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 21, bottom: 13),
                      child: PrimaryButton(
                        background: grayColor,
                        color: whiteColor,
                        text: 'Log in',
                        func: AuthService().anonymousLogin,
                      ),
                    ),
                    Text(
                      'By continuing you agree to our Terms & Conditions',
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 9, color: grayColor),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}
