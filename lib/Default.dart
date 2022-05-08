import 'package:flutter/material.dart';

class Deftext extends StatelessWidget {
  const Deftext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No snapshot data or active or waiting'),
        ),
      ),
    );
  }
}


// switch (snapshot.connectionState) {
//               case ConnectionState.done:
//                const Homereal(title: 'HII');
//                 break;
//               case ConnectionState.none:
//                 const Deftext();
//                 break;
//               case ConnectionState.waiting:
//               const Deftext();
//                 break;
//               case ConnectionState.active:
//               const Deftext();
//                 break;
//             }
