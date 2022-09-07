import 'package:flutter/material.dart';
import 'package:mybeauty/services/auth.dart';
import 'package:mybeauty/screens/login/login_screen.dart';
import 'package:mybeauty/screens/bookings/booking_screen.dart';
import 'package:mybeauty/screens/setting/setting_screen.dart';
import 'package:mybeauty/screens/beauty/beauty_screen.dart';
import 'package:mybeauty/screens/nails/nail_screen.dart';
import 'package:mybeauty/components/custom_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    const NailScreen(),
    const BeautyScreen(),
    const SettingScreen(),
    const BookingScreen()
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading...');
          } else if (snapshot.hasError) {
            return const Text('error');
          } else if (snapshot.hasData) {
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
