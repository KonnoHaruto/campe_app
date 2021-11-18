import 'package:campe_app/view/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential> signIn() => auth.signInAnonymously();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          title: Text('登録'),
          onPressed: () {
            if (user != null) {
              Navigator.push(context, RootPage());
            }
          }
        ),
      )
    );
  }
}