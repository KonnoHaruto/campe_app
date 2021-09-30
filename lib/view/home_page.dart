import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageProvider = StateProvider<PageType>((ref) => PageType.first);

enum PageType {
  first,
  second,
  third,
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Widget> _pageList = <Widget>[
    const HomePage(),
    const AddingPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final pageType = watch(pageProvider);

        final tabItems = [
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.plusSquare),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.sun),
            label: 'Setting',
          )
        ];

        return Scaffold(
          body: _pageList[pageType.state.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageType.state.index,
            onTap: (index) {
              pageType.state = PageType.values[index];
            },
            items: tabItems,
          ),
        );
      },
    );
  }
}

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

class AddingPage extends ConsumerWidget {
  const AddingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return const Scaffold();
  }
}
