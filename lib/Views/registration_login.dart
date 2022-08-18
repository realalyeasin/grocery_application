import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/auth_service.dart';

class Login extends StatelessWidget {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Grocery Application',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Log In your account",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: authService.email,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: authService.password,
              decoration: InputDecoration(
                labelText: 'Password',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (authService.email != "" && authService.password != "") {
                    authService.loginUser(context);
                  }
                },
                child: Text("Log In")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text("Create an account"))
          ],
        ),
      ),
    );
  }
}

class Register extends StatelessWidget {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Grocery Application',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Register your account",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: authService.email,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: authService.password,
              decoration: InputDecoration(
                labelText: 'Password',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (authService.email != "" && authService.password != "") {
                    authService.registerUser(context);
                  }
                },
                child: Text("Register")),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Already have an account? Log In"))
          ],
        ),
      ),
    );
  }
}