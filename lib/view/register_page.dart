import 'package:campe_app/view/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final auth = FirebaseAuth.instance;

  bool get isLoggedIn => auth.currentUser != null;

  Future<UserCredential> signInWithAnonymously() async =>
      await auth.signInAnonymously();

  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 270),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 100,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 60),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      signInWithAnonymously();
                      //signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
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
