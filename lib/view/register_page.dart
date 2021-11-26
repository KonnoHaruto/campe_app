import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'root_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    await auth.signInAnonymously();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              // Icon
              Container(
                padding: const EdgeInsets.only(top: 270),
                child: const FaIcon(FontAwesomeIcons.userPlus, size: 100,),
                ),
              // TextButton
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: SizedBox(
                  width: 250,
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )
                    ),
                    child: const Text('登録', 
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      )),
                    onPressed: () async {
                      await signIn();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                        return RootPage();
                      }));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
