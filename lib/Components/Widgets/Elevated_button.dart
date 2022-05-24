import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevBtn extends StatelessWidget {
  const ElevBtn(
      {Key? key,
      required this.btnText,
      this.color,
      required this.size,
      required this.pressedact,
      required this.shadowclr})
      : super(key: key);

  final String btnText;
  final Color? color;
  final Size size;
  final VoidCallback pressedact;
  final Color shadowclr;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressedact,
      child: Text(btnText),
      style: ElevatedButton.styleFrom(
        shadowColor: shadowclr,
        elevation: 5,
        primary: color,
        fixedSize: size,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        textStyle: GoogleFonts.inter(
          textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
