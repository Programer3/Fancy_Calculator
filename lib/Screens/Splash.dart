// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'Home.dart';
import '/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splash extends StatefulWidget {
  Splash({Key? key, this.isDark}) : super(key: key);
  late bool? isDark;
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigator();
  }

  Future navigator() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      if (fireinst.currentUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              isDark: widget.isDark,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      }
    });
    // StreamBuilder<User?>(
    //   stream: fireinst.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) {
    //       return const Landing();
    //     } else {
    //       return Home();
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    // Duration duration = const Duration(milliseconds: 1500);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
          ),
          Center(
            child: TextLiquidFill(
              loadDuration: const Duration(milliseconds: 1200),
              text: 'HII',
              boxBackgroundColor: Colors.teal,
              waveColor: Colors.white,
              waveDuration: const Duration(milliseconds: 400),
            ),
          ),
        ],
      ),
      // width: MediaQuery.of(context).size.width * 0.8,
      // height: MediaQuery.of(context).size.height * 0.8,
      // fit: BoxFit.contain,
    );
  }
}
