import 'package:campe_app/view/home_page.dart';

import 'view/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        //遷移先ページのルートを定義
        '/': (context) => const HomeScreen(),
        // '/add': (context) => const AddScreen(),
      },
      title: 'カンペアップ',
      home: const HomeScreen(),
    );
  }
}
