import 'package:campe_app/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final MaterialColor customSwatch = const MaterialColor(
  0xFFFF6B0000,
  <int, Color>{
    50:  Color(0xFFF3E0E0),
    100:  Color(0xFFE0B3B3),
    200:  Color(0xFFCC8080),
    300:  Color(0xFFB84D4D),
    400:  Color(0xFFA82626),
    500:  Color(0xFF990000),
    600:  Color(0xFF910000),
    700:  Color(0xFF860000),
    800:  Color(0xFF7C0000),
    900:  Color(0xFF6B0000),
  },
);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: customSwatch,),
      title: 'カンペアップ',
      home: RegisterPage(),
    );
  }
}