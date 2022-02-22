import 'package:campe_app/view/screens/setting_screen.dart';
import 'package:campe_app/view/widgets/campe_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingScreen();
                  },
                ),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.cog),
          ),
        ],
        backgroundColor: Colors.indigo,
      ),
      body: const CampeList(),
    );
  }
}
