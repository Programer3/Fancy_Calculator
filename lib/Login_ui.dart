import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Textfields.dart';
import 'package:flutter_application_1/auth_Buttons.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

// ignore: camel_case_types
class Login_ui extends StatefulWidget {
  const Login_ui({
    Key? key,
  }) : super(key: key);

  @override
  State<Login_ui> createState() => _Login_uiState();
}

// ignore: camel_case_types
class _Login_uiState extends State<Login_ui> {
  @override
  void dispose() {
    Loader.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final TextEditingController _email = TextEditingController();
    late final TextEditingController _password = TextEditingController();
    return WillPopScope(
      onWillPop: () async => !Loader.isShown,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 230, 219, 208),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Text(
                "WELCOME BACK".toUpperCase(),
                style: const TextStyle(
                    color: Color(0xff0c0c0c),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              Textfields(
                email: _email,
                password: _password,
              ),
              const SizedBox(height: 30.0),
              Hero(
                tag: 'login',
                child: AuthButton(
                    aonPressed: () async {
                      if (_email.text.isEmpty || _password.text.isEmpty) {
                        return;
                      } else {
                        try {
                          setState(() {
                            Loader.show(context,
                                progressIndicator:
                                    const LinearProgressIndicator());
                          });
                          await fireinst.signInWithEmailAndPassword(
                              email: _email.text, password: _password.text);
                          print('showLoaderDialog');
                          if (fireinst.currentUser != null) {
                            _email.clear();
                            _password.clear();
                            setState(() {
                              Loader.hide();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                            print('circle popped');
                          }
                        } on FirebaseAuthException catch (e) {
                          print('Failed with error code: ${e.code}');
                          print(e.message);
                          print(e.toString());
                        }
                      }
                    },
                    asaytext: 'Login',
                    awidth: 250,
                    aheight: 50,
                    acolor: kTextColor),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      "Create Account".toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xff262726),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    color: const Color(0xff0c0c0c),
                    width: 2.0,
                    height: 20.0,
                  ),
                  TextButton(
                    child: Text(
                      "Forgot Password".toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xff262726),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
