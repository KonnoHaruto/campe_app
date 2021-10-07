import 'update_page.dart';

import '../view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(campeListProvider);
    final viewModel = watch(campeListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'カンペ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.separated(
        itemCount: state.campeList.length,
        itemBuilder: (BuildContext context, int index) {
          final data = state.campeList[index];
          return ListTile(
            title: Text(data.text),
            onTap: () {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePage(data),
                ),
              );
            },
            trailing: IconButton(
              onPressed: () {
                viewModel.deleteCampe(data.id);
              },
              icon: const Icon(Icons.check_box_outline_blank),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
          );
        },
      ),
    );
  }
}
