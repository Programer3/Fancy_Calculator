import 'package:flutter/material.dart';
import 'Main_button.dart';
import 'package:flutter_application_1/constants.dart';

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
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height / 19,
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
                  const SizedBox(height: 10),
                  const SizedBox(height: 30),
                  MainButton(
                    title: 'SIGN UP TO GET STARTED',
                    color: kPrimaryColor,
                    tapEvent: () {},
                  ),
                  const SizedBox(width: 10),
                  MainButton(
                    title: 'Sign In',
                    color: kSecondaryColor,
                    tapEvent: () {},
                  ),
                ],
              ),
            ],
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