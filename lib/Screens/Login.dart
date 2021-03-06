import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/Components/Textfields.dart';
import 'package:flutter_application_1/Components/auth_Buttons.dart';
import 'package:flutter_application_1/Screens/Signup.dart';
import 'package:flutter_application_1/constants.dart';

// ignore: camel_case_types
class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// ignore: camel_case_types
class _LoginState extends State<Login> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  Future signin(String email, String password) async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      return;
    } else {
      try {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            });
        await fireinst.signInWithEmailAndPassword(
            email: _email.text, password: _password.text);
        Navigator.of(context).pop();
        if (fireinst.currentUser != null) {
          _email.clear();
          _password.clear();
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
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    await signin(_email.text, _password.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                    );
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
    );
  }
}
