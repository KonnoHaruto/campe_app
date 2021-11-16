import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
