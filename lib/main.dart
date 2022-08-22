import 'package:flutter/material.dart';
import 'package:mybeauty/routes.dart';
import 'package:mybeauty/screens/splash/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: const MainScreen(title: 'Flutter Demo Home Page'),
          // We use routeName so that we dont need to remember the name
          initialRoute: SplashScreen.routeName,
          routes: routes,
        );
        }

        return Text('loading...');
      },
    );
  }
}
