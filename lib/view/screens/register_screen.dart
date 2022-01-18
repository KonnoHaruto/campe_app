import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../root_page.dart';

class RegisterScreen extends ConsumerWidget {
  
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final auth = FirebaseAuth.instance;


  Future<void> signIn() async {
    auth.signInAnonymously();
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
