import 'package:flutter/material.dart';
import 'Main_button.dart';
import 'package:flutter_application_1/constants.dart';

class Jumbotron extends StatelessWidget {
  const Jumbotron({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height / 10,
                  ),
                  Stack(
                    children: [Image.asset(
                      'assets/images/025.png',
                      height: size.height / 8,
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
                              color: kTextColor),
                        ),
                        TextSpan(
                          text: 'Yoga Lifestyle',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Studio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We are trying very hard to create all the condition so that your stay in the studio is comfortable and favorable or creativity and creation. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 6, fontWeight: FontWeight.w300),
                  ),],

                   
                  const SizedBox(height: 86),
                  Wrap(
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      MainButton(
                        title: 'SIGN UP TO GET STARTED',
                        color: kPrimaryColor,
                        tapEvent: () {},
                      ),
                      const SizedBox(width: 10),
                      MainButton(
                        title: 'Sign In',
                        color: kSecondaryColor,
                        tapEvent: () {},
                      ),
                    ],
                  ),
                
              ),
            
          
        ],
      ),
            ),),
      );
  }
}
