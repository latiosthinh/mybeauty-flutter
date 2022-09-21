// We use name route
// All our routes will be available here
import 'package:mybeauty/screens/Login/login_screen.dart';
import 'package:mybeauty/screens/beauty/beauty_screen.dart';
import 'package:mybeauty/screens/bookings/booking_screen.dart';
import 'package:mybeauty/screens/import-booking/import_booking_screen.dart';
import 'package:mybeauty/screens/main/main_screen.dart';
import 'package:mybeauty/screens/nails/nail_screen.dart';
import 'package:mybeauty/screens/register/register_screen.dart';
import 'package:mybeauty/screens/setting/country_screen.dart';
import 'package:mybeauty/screens/setting/setting_screen.dart';
import 'package:mybeauty/screens/setting/term_screen.dart';
import 'package:mybeauty/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  BookingScreen.routeName: (context) => const BookingScreen(),
  NailScreen.routeName: (context) => const NailScreen(),
  BeautyScreen.routeName: (context) => const BeautyScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  ImportBooking.routeName: (context) => const ImportBooking(),
  CountryScreen.routeName: (context) => const CountryScreen(),
  TermScreen.routeName: (context) => const TermScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
};
