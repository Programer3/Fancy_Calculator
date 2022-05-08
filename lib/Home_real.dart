import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homereal extends StatelessWidget {
  const Homereal({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    // final User = Firebase.instance.currentUser;

    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            Text(title),
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.lock),
                color: Colors.blue),
          ],
        )),
      ),
    );
  }
}
