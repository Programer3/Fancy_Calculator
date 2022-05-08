/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Home_real.dart';

class Login_ui extends StatelessWidget {
  static const String path = "lib/src/pages/login/login5.dart";

  const Login_ui({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late final TextEditingController _email = TextEditingController();
    late final TextEditingController _password = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 219, 208),
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.lightGreen,
          //     Color.fromARGB(255, 83, 195, 87),
          //   ],
          // ),
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
            TextField(
              controller: _email,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xff262726),
                  ),
                ),
                hintText: "Enter your email",
                hintStyle: const TextStyle(
                  color: Color(0xff8d8c8c),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15.0),
            TextField(
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.lock,
                    color: Color(0xff262726),
                  ),
                ),
                hintText: "Enter your password",
                hintStyle: const TextStyle(
                  color: Color(0xff8d8c8c),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              // width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff262726),
                  onSurface: const Color.fromARGB(255, 52, 218, 52),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  fixedSize: const Size(250, 50),
                ),
                child: Text(
                  "Login".toUpperCase(),
                ),
                onPressed: () {},
              ),
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
                  onPressed: () {},
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
