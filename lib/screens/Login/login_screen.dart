import 'package:flutter/material.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/screens/index.dart';
import 'package:mybeauty/services/auth.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/widgets/index.dart';

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
                title: const Text(
                  'Log in with MyNails account',
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
                    const VSpacer(9),
                    PrimaryButton(
                      icon: Icons.facebook,
                      background: blueColor,
                      color: whiteColor,
                      text: 'Sign in with Facebook',
                      func: AuthService().anonymousLogin,
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
                    const Center(
                      child: Text(
                        'or use your email',
                        style: TextStyle(fontSize: 18.0),
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
                                  borderSide: BorderSide(
                                      color: pinkColor, width: 1.0))))
                    ]),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 28.0),
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(color: redColor),
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
                    const Text(
                      'By continuing you agree to our Terms & Conditions',
                      style: TextStyle(fontSize: 9, color: grayColor),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}
