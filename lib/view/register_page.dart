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
                Container(
                  padding: const EdgeInsets.only(top: 300),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background-icon.png'),
            fit: BoxFit.cover,
          )),
                child: Container(
                  padding: const EdgeInsets.only(top: 90),
                  child: SizedBox(
                    width: 350,
                    height: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                      child: const Text(
                        '登録',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        await signIn();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RootPage();
                        }));
                      },
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
