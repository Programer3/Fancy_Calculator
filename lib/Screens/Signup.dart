import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Textfields.dart';
import 'package:flutter_application_1/Components/auth_Buttons.dart';
import 'package:flutter_application_1/constants.dart';
import '../Components/Textfields.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  Future signup(String email, String password) async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      return;
    } else {
      try {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            });
        await fireinst.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);
        Navigator.of(context).pop();
        if (fireinst.currentUser != null) {
          useandclear();
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } on FirebaseAuthException catch (e) {
        // ignore: avoid_print
        print('Failed with error code: ${e.code}');
        // ignore: avoid_print
        print(e.message);
        // ignore: avoid_print
        print(e.toString());
      }
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void useandclear() {
    _email.clear();
    _password.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: SingleChildScrollView(
              // to avoid overflow error and "resizeToAvoidBottomInset: false",
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
                              await signup(_email.text, _password.text);
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
                            Navigator.pop(context);
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
