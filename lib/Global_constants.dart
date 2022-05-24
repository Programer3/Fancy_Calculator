import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Components/Controllers/Authcontroller.dart';

// Colors :

// const kPrimaryColor = Color(0XFF55E6C1);
// const kPrimaryLightColor = Color(0XFF9AECDB);
// const kSecondaryColor = Color(0XFF2B224B);
// const kTeriary = Color(0XFFEAB543);
// const kAccent = Color(0xff2C3A47);
// const kTextColor = Color(0XFF282828);
// const kTextLightColor = Color(0XFF959595);

const Color kNicecalm = Color(0xFF00adb5);
const Color kGunmetal = Color(0xFF222831);
const Color kChestorange = Color(0xFFcd5334);
const Color kEmerald = Color(0xFF2cd36e);
const Color kHanpurple = Color(0xFF6724db);
const Color kMintCream = Color(0xFFf7fff7);
const Color kOnyx = Color(0xFF393e46);
const Color kCultured = Color(0xFFeeeeee);

//finals

final fireinst = FirebaseAuth.instance;
Authcontroller authcontroller = Authcontroller();
//Others

const kRadiusthirty = Radius.circular(30.0);
const bool kTrue = true;
const bool kFalse = false;
const EdgeInsets kPadding25 =
    EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0);
const EdgeInsets kPadding2 = EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0);
