// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Home.dart';
import 'Landing.dart';
import 'constants.dart';

class Lottiepage extends StatefulWidget {
  const Lottiepage({Key? key}) : super(key: key);

  @override
  State<Lottiepage> createState() => _LottiepageState();
}

class _LottiepageState extends State<Lottiepage> {
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
            builder: (context) => Home(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Landing(),
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
        // body: Stack(
        //   children: [
        //     Container(
        //       height: double.infinity,
        //       decoration: const BoxDecoration(
        //         color: Colors.teal,
        //       ),
        //     ),
        //     Center(
        //       child: Lottie.network(
        //         'https://assets7.lottiefiles.com/packages/lf20_2ixzdfvy.json',
        //         width: MediaQuery.of(context).size.width * 0.8,
        //         height: MediaQuery.of(context).size.height * 0.8,
        //         fit: BoxFit.contain,
        //       ),
        //     ),
        //   ],
        // ),
        body: Center(
      child: Lottie.network(
        'https://assets7.lottiefiles.com/packages/lf20_2ixzdfvy.json',
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        fit: BoxFit.contain,
      ),
    ));
  }
}
