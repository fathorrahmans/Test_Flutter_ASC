import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_cli2/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final authC = FirebaseAuth.instance;

  final emailC = TextEditingController(text: "admin@gmail.com");
  final passC = TextEditingController(text: "admin1");

  Stream<User?> get streamAuthStatus => authC.authStateChanges();

  void login(String email, String password) async {
    try {
      await authC.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        print('Nothing Email in database');
      }
    }
  }
}
