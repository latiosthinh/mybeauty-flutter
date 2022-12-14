import 'package:mybeauty/screens/index.dart';
import 'package:flutter/widgets.dart';
import 'package:mybeauty/screens/profile/profile_screen.dart';

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
  ContentPreferenceScreen.routeName: (c) => const ContentPreferenceScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
};
