// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Global_constants.dart';
import 'Authentication/Login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage> {
  void onwillpop() {
    if (fireinst.currentUser == null) {
      Get.back();
    } else {
      showDialog(
        barrierDismissible: true,
        builder: (BuildContext context) => showsalert(context),
        context: context,
      );
    }
  }

  Widget showsalert(context) {
    return AlertDialog(
      content: const Text('Do You Want To Quit This App'),
      title: const Text('Alert'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('NO'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            SystemNavigator.pop();
          },
          child: const Text('YES'),
        ),
      ],
      backgroundColor: kMintCream,
      elevation: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onwillpop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: kGunmetal,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text('PROFILE',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        fontFamily: 'sans-serif-light',
                                        color: Colors.black)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Stack(fit: StackFit.loose, children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 90.0, right: 100.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 25.0,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        authcontroller.signout();
                                        Get.offAll(() => const Login());
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: const Color(0xffFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Parsonal Information',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[],
                                )
                              ],
                            ),
                          ),
                          const ShowReppadding(
                            title: 'Name',
                          ),
                          const Showrepsubpad(
                            hinttext: 'Enter Ur Name',
                          ),
                          ShowReppadding(
                            title: 'HI, ${fireinst.currentUser?.email}',
                          ),
                          const Showrepsubpad(hinttext: 'Enter Email ID'),
                          ShowReppadding(
                            title: fireinst.currentUser == null
                                ? 'Null User Sussy'
                                : fireinst.currentUser!.uid,
                          ),
                          const Showrepsubpad(hinttext: 'Enter Mobile No'),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Expanded(
                                  child: Text(
                                    'Pin Code',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Text(
                                    'State',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Enter Pin Code"),
                                        enabled: false,
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Enter State"),
                                      enabled: false,
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Showrepsubpad extends StatelessWidget {
  const Showrepsubpad({
    required this.hinttext,
    Key? key,
  }) : super(key: key);

  final String? hinttext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding2,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: hinttext,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowReppadding extends StatelessWidget {
  const ShowReppadding({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding25,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
