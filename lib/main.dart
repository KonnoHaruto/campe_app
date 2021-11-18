import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'view/registor_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final MaterialColor _customSwatch = const MaterialColor(
    0xFFFF6B0000,
    <int, Color>{
      50: Color(0xFFF3E0E0),
      100: Color(0xFFE0B3B3),
      200: Color(0xFFCC8080),
      300: Color(0xFFB84D4D),
      400: Color(0xFFA82626),
      500: Color(0xFF990000),
      600: Color(0xFF910000),
      700: Color(0xFF860000),
      800: Color(0xFF7C0000),
      900: Color(0xFF6B0000),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: _customSwatch,
      ),
      title: 'カンペアップ',
      home: RegistorPage(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Center(
          child: lightMode
              ? const Icon(Icons.flutter_dash)
              : const Icon(
                  Icons.flutter_dash,
                  color: Colors.black,
                )),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
