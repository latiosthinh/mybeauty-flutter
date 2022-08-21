import 'package:flutter/material.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/enums.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
