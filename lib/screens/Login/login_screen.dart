import 'package:flutter/material.dart';
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
        title: const Text(
          'Log in with MyNails account',
          style: TextStyle(color: blackColor),
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 38, left: 38, right: 38),
            child: SizedBox(
              width: double.infinity,
              height: 38,
              child: TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: pinkColor,
                    primary: blackColor),
                child: const Text('Sign in with Apple'),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 9, left: 38, right: 38, bottom: 40),
            child: SizedBox(
              width: double.infinity,
              height: 38,
              child: TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: blueColor,
                    primary: whiteColor),
                child: const Text('Sign in with Apple'),
              ),
            ),
          ),
          const Center(
            child: Text('or use your email'),
          ),
          Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: pinkColor,
                          width: 1,
                          style: BorderStyle.solid)),
                  labelText: 'Email'),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Password'),
            )
          ]),
          Container(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => {},
              child: const Text(
                'Forgot your password?',
                style: TextStyle(color: redColor),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 21, left: 38, right: 38, bottom: 13),
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
                child: const Text('Log in'),
              ),
            ),
          ),
          const Text(
            'By continuing you agree to our Terms & Conditions',
            style: TextStyle(fontSize: 9, color: grayColor),
          )
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
