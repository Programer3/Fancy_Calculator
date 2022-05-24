import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Widgets/Textfields.dart';
import 'package:flutter_application_1/Global_constants.dart';
import 'package:get/get.dart';
import '../../Components/Widgets/Elevated_button.dart';
import '../../Components/Widgets/Textfields.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // void useandclear() {
  //   _email.clear();
  //   _password.clear();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGunmetal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: CustomScrollView(
              // https://stackoverflow.com/questions/56326005/how-to-use-expanded-in-singlechildscrollview
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: size.height / 20,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome To\n',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: kCultured),
                            ),
                            TextSpan(
                              text: 'Yoga Lifestyle',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  color: kChestorange),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 22,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/025.png',
                            height: size.height / 2.3,
                          ),
                          Textfields(
                            email: _email,
                            password: _password,
                          ),
                        ],
                      ),
                      SizedBox(height: size.height / 18),
                      Hero(
                        tag: 'register',
                        child: ElevBtn(
                            color: kEmerald,
                            btnText: 'Register',
                            size: const Size(250, 55),
                            pressedact: () {
                              authcontroller.signin(
                                  _email.text, _password.text, context);
                            },
                            shadowclr: kCultured),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Get.toNamed('/login'),
                        child: const Text(
                          'Already Have an Account? Log In Instead',
                          style: TextStyle(color: kNicecalm),
                        ),
                      ),
                    ],
                  ),
                  hasScrollBody: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
