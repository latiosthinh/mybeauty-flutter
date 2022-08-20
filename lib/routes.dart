// We use name route
// All our routes will be available here
import 'package:mybeauty/screens/main/main_screen.dart';
import 'package:mybeauty/screens/setting/setting_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:mybeauty/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(
        title: 'Setting',
      ),
  MainScreen.routeName: (context) => const MainScreen(
        title: 'Home',
      ),
};
