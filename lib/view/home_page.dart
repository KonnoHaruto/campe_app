import 'package:campe_app/view/adding_page.dart';
import 'package:campe_app/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(CampeListProvider);
    final viewModel = watch(CampeListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('カンペ'),
      ),
      body: ListView.builder(
        itemCount: state.campeList.length,
        itemBuilder: (BuildContext context, int index) {
          final data = state.campeList[index];
          return ListTile(
            title: Text(data.text),
            onTap: () {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddingPage(),
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
      ),
    );
  }
}
