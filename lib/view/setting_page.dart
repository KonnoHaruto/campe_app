import 'package:campe_app/reference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return PageView(
        scrollDirection: Axis.vertical, 
        controller: controller, 
        children: const [
          Icon(Icons.close)
        ]);
  }
}
