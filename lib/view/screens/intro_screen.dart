// TODO(晴都): イントロダクションスクリーンを実装する
import 'package:campe_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends ConsumerWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'タイトル',
          body: '説明をここに記述',
          image: Center(
            child: Image.asset('assets/campe_remake.png'),
          ),
          decoration: const PageDecoration(
            pageColor: Colors.indigo,
          ),
        ),
      ],
      onDone: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute(
            builder: (_) {
              return const HomeScreen();
            },
          ),
        );
      },
      showBackButton: false,
      showSkipButton: true,
      skip: const Text('スキップ'),
      done: const Text(
        '完了',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
