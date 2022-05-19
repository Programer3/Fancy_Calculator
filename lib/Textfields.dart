import 'package:flutter/material.dart';
import 'constants.dart';

class Textfields extends StatefulWidget {
  Textfields({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  late TextEditingController email;
  late TextEditingController password;

  @override
  State<Textfields> createState() => _TextfieldsState();
}

class _TextfieldsState extends State<Textfields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.email,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: kTextColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: kTextColor,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(16.0),
            prefixIcon: Container(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              margin: const EdgeInsets.only(right: 8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: kRadiusthirty,
                  bottomLeft: kRadiusthirty,
                  topRight: kRadiusthirty,
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xff262726),
              ),
            ),
            hintText: "Enter your email",
            hintStyle: const TextStyle(
              color: Color(0xff8d8c8c),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 15.0),
        TextField(
          controller: widget.password,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: kTextColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: kTextColor,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(16.0),
            prefixIcon: Container(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              margin: const EdgeInsets.only(right: 8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: kRadiusthirty,
                  bottomLeft: kRadiusthirty,
                  topRight: kRadiusthirty,
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: const Icon(
                Icons.lock,
                color: Color(0xff262726),
              ),
            ),
            hintText: "Enter your password",
            hintStyle: const TextStyle(
              color: Color(0xff8d8c8c),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
