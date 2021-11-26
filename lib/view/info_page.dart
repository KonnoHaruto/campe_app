import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 90,
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('戻る', style: TextStyle(color: Colors.white),)),
        title: const Text('カンペアプリの使い方'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('ここに使い方画像を挿入'),
        ),
      ),
    );
  }
}
