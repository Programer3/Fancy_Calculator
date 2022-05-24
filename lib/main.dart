import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/Choose_auth.dart';
import 'package:flutter_application_1/Screens/profile_screen.dart';
import 'package:get/get.dart';
import 'Screens/Authentication/Login.dart';
import 'Screens/Authentication/Signup.dart';
import 'Screens/Splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(
    // MultiProvider(
    //   providers: const [],
    const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: Splash(
      //   isDark: isDark,
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/profile': (context) => const ProfilePage(),
        '/choose': (context) => const Chooseauth(),
      },
    );
  }
}
