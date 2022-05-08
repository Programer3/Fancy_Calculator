import 'package:flutter/material.dart';
import 'package:flutter_application_1/Jumbotron.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //size of the screen
    return Scaffold(
      
      body: SafeArea(
        child: Container(
          width: size.width,
          constraints: BoxConstraints(minHeight: size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Jumbotron(),
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