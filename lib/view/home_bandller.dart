import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'adding_page.dart';
import 'home_page.dart';
import 'setting_page.dart';

final pageProvider = StateProvider<PageType>((ref) => PageType.home);

enum PageType { home, setting, unKnown }

final tabItems = [
  const BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.home),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.sun),
    label: 'Setting',
  )
];

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Widget> _pageList = <Widget>[
    const HomePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageType = watch(pageProvider);

    return Scaffold(
        body: _pageList[pageType.state.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageType.state.index,
          onTap: (index) {
            pageType.state = PageType.values[index];
          },
          items: tabItems,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          // ignore: deprecated_member_use
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return const AddingPage();
              },
            ));
          },
        ));
  }
}
