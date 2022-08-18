

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Views/navbar.dart';
import '../Views/registration_login.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void loginUser(context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
      await auth
          .signInWithEmailAndPassword(
          email: email.text, password: password.text)
          .then((value) => {
        print("User logged in"),
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
                (route) => false)
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.red,
              title: Text("Error Message"),
              content: Text(e.toString()),
            );
          });
    }
  }

  void registerUser(context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
      await auth
          .createUserWithEmailAndPassword(
          email: email.text, password: password.text)
          .then((value) => {
        print("User registered"),
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavBar())),
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.red,
              title: Text("Error Message"),
              content: Text(e.toString()),
            );
          });
    }
  }

  void logOutUser(context) async {
    await auth.signOut();
    print("User logged out");
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}