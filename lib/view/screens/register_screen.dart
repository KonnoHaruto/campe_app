import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bottom_navigation_bar_page.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 270),
                child: const FaIcon(
                  FontAwesomeIcons.userPlus,
                  size: 100,
                ),
              ),
              // TextButton
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: SizedBox(
                  width: 250,
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    child: const Text('登録',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      ref
                          .read(authControllerProvider.notifier)
                          .signInAnoymously();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return BottomNavigationBarPage();
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
