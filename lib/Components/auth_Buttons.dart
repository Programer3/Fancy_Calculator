import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.aonPressed,
    required this.asaytext,
    required this.awidth,
    required this.aheight,
    required this.acolor,
  }) : super(key: key);
  final VoidCallback aonPressed;
  final String asaytext;
  final double awidth;
  final double aheight;
  final Color acolor;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: awidth,
      height: aheight,
      color: acolor,
      onPressed: aonPressed,
      child: Text(
        asaytext,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
