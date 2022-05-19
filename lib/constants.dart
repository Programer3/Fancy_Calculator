import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0XFF55E6C1);
const kPrimaryLightColor = Color(0XFF9AECDB);
const kSecondaryColor = Color(0XFF2B224B);
const kTeriary = Color(0XFFEAB543);
const kAccent = Color(0xff2C3A47);
const kTextColor = Color(0XFF282828);
const kTextLightColor = Color(0XFF959595);
const kRadiusthirty = Radius.circular(30.0);

//fxns
fshowLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//finals

final fireinst = FirebaseAuth.instance;
