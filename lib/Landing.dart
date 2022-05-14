import 'package:flutter/material.dart';
import 'Main_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:animated_button/animated_button.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height / 21,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome To\n',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: kTextColor),
                      ),
                      TextSpan(
                        text: 'Yoga Lifestyle',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 22,
                ),
                Image.asset(
                  'assets/images/025.png',
                  height: size.height / 2.3,
                ),
                SizedBox(height: size.height / 21),
                Wrap(
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    AnimatedButton(
                      width: 300,
                      height: 55,
                      color: kPrimaryColor,
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AnimatedButton(
                      width: 250,
                      height: 50,
                      color: kTextColor,
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Signup(title: 'HII');
//           } else {
//             return const Homereal(title: 'HII');
//           }
//         },
//       ),