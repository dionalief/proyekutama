import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<bool> loginuser(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {print("user is Logged In")});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void RegisterUser(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print("User is Registered");
      });
    } catch (e) {
      print(e);
    }
  }
}
