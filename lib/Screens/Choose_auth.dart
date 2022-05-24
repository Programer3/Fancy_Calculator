import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Widgets/Elevated_button.dart';
import 'package:flutter_application_1/Global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Chooseauth extends StatefulWidget {
  const Chooseauth({Key? key}) : super(key: key);

  @override
  _ChooseauthState createState() => _ChooseauthState();
}

class _ChooseauthState extends State<Chooseauth> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kGunmetal,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: kGunmetal,
          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: Image.asset(
          //     'assets/images/025.png',
          //   ).image,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/025.png',
                      width: 164,
                      height: 234,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Hero(
                              tag: 'login',
                              child: ElevBtn(
                                color: kEmerald,
                                btnText: 'Login',
                                size: const Size(240, 60),
                                pressedact: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
                                },
                                shadowclr: kCultured,
                              ),
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            Hero(
                              tag: 'Register',
                              child: ElevBtn(
                                color: kEmerald,
                                btnText: 'Register',
                                size: const Size(240, 60),
                                pressedact: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signup');
                                },
                                shadowclr: kCultured,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                authcontroller.guestuser();
                              },
                              child: Text(
                                'Try Guest User',
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    color: kNicecalm,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
