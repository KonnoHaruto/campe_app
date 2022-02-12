import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:campe_app/view/campe_list.dart';
import 'package:campe_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'info_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'カンペ 一覧',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leadingWidth: 80,
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.signInAlt),
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return const RegisterScreen();
              }), (route) => false);
            }),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bars),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const InfoPage()));
            },
          ),
        ],
        backgroundColor: Colors.indigo,
      ),
      body: const CampeList(),
    );
  }
}
