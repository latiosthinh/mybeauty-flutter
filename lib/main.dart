import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybeauty/routes.dart';
import 'package:mybeauty/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mybeauty/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Directionality(
              textDirection: TextDirection.ltr, child: Text('error...'));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'My Nails',
            theme: theme(),
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
            routes: routes,
          );
        }

        return const Directionality(
            textDirection: TextDirection.ltr, child: Text('loading...'));
      },
    );
  }
}
