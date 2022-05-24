import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Widgets/Elevated_button.dart';
import 'package:flutter_application_1/Components/Widgets/Textfields.dart';
import 'package:flutter_application_1/Global_constants.dart';

// ignore: camel_case_types
class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// ignore: camel_case_types
class _LoginState extends State<Login> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        decoration: const BoxDecoration(
          color: kGunmetal,
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height * .95), // IMP
            // constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                Text(
                  "WELCOME BACK".toUpperCase(),
                  style: const TextStyle(
                      color: kMintCream,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40.0),
                Textfields(
                  email: _email,
                  password: _password,
                ),
                const SizedBox(height: 30.0),
                Hero(
                  tag: 'login',
                  child: ElevBtn(
                      color: kEmerald,
                      btnText: 'Login',
                      size: const Size(250, 55),
                      pressedact: () => authcontroller.signin(
                          _email.text, _password.text, context),
                      shadowclr: kCultured),
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
                          color: kNicecalm,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
                    Container(
                      color: kCultured,
                      width: 2.0,
                      height: 20.0,
                    ),
                    TextButton(
                      child: Text(
                        "Forgot Password".toUpperCase(),
                        style: const TextStyle(
                          color: kNicecalm,
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
        ),
      ),
    );
  }
}
