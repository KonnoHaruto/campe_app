import 'package:campe_app/view/screens/home_screen.dart';
import 'package:campe_app/view/screens/preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'screens/making_screen.dart';

final pageProvider = StateProvider<PageType>((ref) => PageType.home);

enum PageType { home, preview }

class RootPage extends ConsumerWidget {
  RootPage({Key? key}) : super(key: key);
  final List<Widget> _pageList = <Widget>[
    const HomeScreen(),
    const PreviewScreen(),
  ];

  final _tabItems = [
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.home),
      label: 'ホーム',
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.alignJustify),
      label: 'プレビュー',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageType = ref.watch(pageProvider.state);
    return Scaffold(
        body: _pageList[pageType.state.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageType.state.index,
          fixedColor: Colors.indigo,
          onTap: (index) {
            pageType.state = PageType.values[index];
          },
          items: _tabItems,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          // ignore: deprecated_member_use
          backgroundColor: Colors.indigo,
          child: const FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return const MakingScreen();
              },
            ));
          },
        ));
  }
}
