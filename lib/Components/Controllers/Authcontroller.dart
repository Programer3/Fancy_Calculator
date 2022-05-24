import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/profile_screen.dart';
import 'package:get/get.dart';
import '../../Global_constants.dart';

class Authcontroller extends GetxController {
  void signin(String email, String password, context) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error Signing In',
        "Please make sure all fields marked '*' are filled",
        snackPosition: SnackPosition.BOTTOM,
        colorText: kMintCream,
      );
    } else {
      try {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
        await fireinst.signInWithEmailAndPassword(
            email: email, password: password);
        Get.back();
        Get.offAll(const ProfilePage());
      } on FirebaseAuthException catch (e) {
        Get.back();
        // ignore: avoid_print
        print('Failed with error code: ${e.code}');
        Get.snackbar(
          'Error Signing In',
          '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kMintCream,
        );
        // ignore: avoid_print
        print(e.message);
        // ignore: avoid_print
        print(e.toString());
      }
    }
  }

  void signup(String email, String password, context) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error Signing Up',
        "Please make sure all fields marked '*' are filled",
        snackPosition: SnackPosition.BOTTOM,
        colorText: kMintCream,
      );
    } else {
      try {
        showDialog(
            barrierDismissible: kFalse,
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
        await fireinst.createUserWithEmailAndPassword(
            email: email, password: password);
        Get.back();
        Get.offAll(const ProfilePage());
      } on FirebaseAuthException catch (e) {
        Get.back();
        // ignore: avoid_print
        print('Failed with error code: ${e.code}');
        Get.snackbar(
          'Error Signing Up',
          '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kMintCream,
        );
        // ignore: avoid_print
        print(e.message);
        // ignore: avoid_print
        print(e.toString());
      }
    }
  }

  void signout() async {
    try {
      await fireinst.signOut();
    } catch (e) {
      Get.snackbar(
        'Error Signing Out',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: kMintCream,
      );
    }
  }

  void guestuser() {
    Get.toNamed(
      '/profile',
    );
  }
}
