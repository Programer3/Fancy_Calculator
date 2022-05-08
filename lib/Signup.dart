import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/Login_ui.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _email,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
              ),
            ),
            TextField(
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _email.text,
                  password: _password.text,
                );
                _email.clear();
                _password.clear();
              },
              child: const Text('SignUp'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login_ui(),
                  ),
                );
              },
              child: const Text('SignIn'),
            ),
          ],
        ));
  }
}
