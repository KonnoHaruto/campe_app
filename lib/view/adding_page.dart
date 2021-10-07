import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/home_page_view_model.dart';

class AddingPage extends ConsumerWidget {
  const AddingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(campeListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('カンペ作成ページ'),
        // backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(viewModel.textEditingController.text),
            SizedBox(
              width: 300,
              height: 600,
              child: TextField(
                controller: viewModel.textEditingController,
                decoration: const InputDecoration(
                  hintText: "入力してください",
                ),
                autofocus: true, //ページ遷移時に自動フォーカス
                maxLines: null,
                textAlign: TextAlign.left,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.createCampe(viewModel.textEditingController.text);
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
