import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/services/services.dart';
import 'package:mybeauty/components/buttons/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          'Log in with MyNails account',
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              // SizedBox(
              //   width: double.infinity,
              //   height: 38,
              //   child: TextButton.icon(
              //     icon: const Icon(
              //       Icons.apple,
              //       size: 18,
              //     ),
              //     onPressed: () => {},
              //     style: TextButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5)),
              //         backgroundColor: blackColor,
              //         primary: whiteColor),
              //     label: const Text('Sign in with Apple'),
              //   ),
              // ),
              // Container(
              //     margin: const EdgeInsets.only(top: 9, bottom: 40),
              //     child: SizedBox(
              //       width: double.infinity,
              //       height: 38,
              //       child: TextButton.icon(
              //         icon: const Icon(
              //           Icons.facebook,
              //           size: 18,
              //         ),
              //         onPressed: () => {},
              //         style: TextButton.styleFrom(
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(5)),
              //             backgroundColor: blueColor,
              //             primary: whiteColor),
              //         label: const Text('Continue with Facebook'),
              //       ),
              //     )),
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
              // const Center(
              //   child: Text(
              //     'or use your email',
              //     style: TextStyle(fontSize: 18.0),
              //   ),
              // ),
              // Column(children: [
              //   TextFormField(
              //     decoration: const InputDecoration(
              //         enabledBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: pinkColor, width: 1.0)),
              //         labelText: 'Fullname'),
              //   ),
              //   TextFormField(
              //     decoration: const InputDecoration(
              //         enabledBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: pinkColor, width: 1.0)),
              //         labelText: 'Email'),
              //   ),
              //   TextFormField(
              //       decoration: const InputDecoration(
              //           labelText: 'Password',
              //           enabledBorder: UnderlineInputBorder(
              //               borderSide:
              //                   BorderSide(color: pinkColor, width: 1.0))))
              // ]),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   margin: const EdgeInsets.only(top: 28.0),
              //   child: const Text(
              //     'Please enter at least 8 characters',
              //     style: TextStyle(color: grayColor),
              //   ),
              // ),
              // CheckboxListTile(
              //   onChanged: (value) {},
              //   value: false,
              //   title: const Text(
              //     'Send me emails from MyNails with the latest offers & beauty news',
              //     style: TextStyle(fontSize: 10.0),
              //   ),
              //   controlAffinity: ListTileControlAffinity.leading,
              //   contentPadding: const EdgeInsets.all(0),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 10.0),
              //   width: double.infinity,
              //   child: const Text(
              //     'You can find out more about how MyNails stores uses and protects your data in our privacy policy.',
              //     style: TextStyle(fontSize: 10.0),
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 17, bottom: 13),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 38,
              //     child: TextButton(
              //       onPressed: () => {},
              //       style: TextButton.styleFrom(
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(5)),
              //           backgroundColor: grayColor,
              //           primary: blackColor),
              //       child: const Text('Create your account'),
              //     ),
              //   ),
              // ),
              // const Text(
              //   'By continuing you agree to our Terms & Conditions',
              //   style: TextStyle(fontSize: 9, color: grayColor),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
