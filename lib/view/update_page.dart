import '../model/campe_model.dart';
import '../view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePage extends ConsumerWidget {
  const UpdatePage(this.data, {Key? key}) : super(key: key);

  final CampeModel data;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(campeListProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            // Text(viewModel.textEditingController.text),
            SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                controller: viewModel.textEditingController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.updateCampe(
                    data.id, viewModel.textEditingController.text);
                viewModel.textEditingController.clear();

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              child: const Text('カンペを追加'),
            ),
          ],
        ),
      ),
    );
  }
}
