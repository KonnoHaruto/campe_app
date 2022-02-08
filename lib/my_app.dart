import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:campe_app/view/bottom_navigation_bar_page.dart';
import 'package:campe_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState =
        ref.watch(authControllerProvider.notifier).getCurrentUser();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        title: 'カンペアプリ',
        home: authState ? BottomNavigationBarPage() : const RegisterScreen());
  }
}
