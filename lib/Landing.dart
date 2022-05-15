import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Textfields.dart';
import 'package:flutter_application_1/auth_Buttons.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'Login_ui.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    Loader.hide();
    super.dispose();
  }

  void useandclear() {
    _email.clear();
    _password.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => !Loader.isShown,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          // maintainBottomViewPadding: true,
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
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/025.png',
                        height: size.height / 2.3,
                      ),
                      Textfields(
                        email: _email,
                        password: _password,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height / 21),
                  Wrap(
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: 'register',
                        child: AuthButton(
                            aonPressed: () async {
                              if (_email.text.isEmpty ||
                                  _password.text.isEmpty) {
                                return;
                              } else {
                                try {
                                  await fireinst.createUserWithEmailAndPassword(
                                      email: _email.text,
                                      password: _password.text);
                                  setState(() {
                                    Loader.show(context,
                                        progressIndicator:
                                            const LinearProgressIndicator());
                                  });
                                  print('showLoaderDialog');
                                  if (fireinst.currentUser != null) {
                                    setState(() {
                                      useandclear();
                                      print('useandclear');
                                      Loader.hide();
                                    });
                                  }
                                } on FirebaseAuthException catch (e) {
                                  print('Failed with error code: ${e.code}');
                                  print(e.message);
                                  print(e.toString());
                                }
                              }
                            },
                            asaytext: 'Register',
                            awidth: 300,
                            aheight: 55,
                            acolor: kPrimaryColor),
                      ),
                      Hero(
                        tag: 'login',
                        child: AuthButton(
                          acolor: kTextColor,
                          aheight: 50,
                          aonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login_ui(),
                              ),
                            );
                          },
                          asaytext: 'Login',
                          awidth: 250,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
