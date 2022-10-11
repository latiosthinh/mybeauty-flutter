import 'package:flutter/material.dart';
import 'package:mybeauty/screens/index.dart';
import 'package:mybeauty/components/custom_bottom_navbar.dart';
import 'package:mybeauty/services/auth.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    const NailScreen(),
    const BeautyScreen(),
    const BookingWrapper(),
    const SettingScreen(),
  ];

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && AuthService().user != null) {
            return Scaffold(
                body: Center(
                  child: _screens.elementAt(_selectedIndex),
                ),
                bottomNavigationBar: _showBottomNav());
          } else {
            return const LoginScreen();
          }
        });
  }

  Widget _showBottomNav() {
    return CustomBottomNavBar(selectedIndex: _selectedIndex, tap: _onTap);
  }
}
