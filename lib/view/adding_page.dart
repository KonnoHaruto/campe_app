import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddingPage extends ConsumerWidget {
  const AddingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('カンペ作成'),
        // backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            // Text(viewModel.textEditingController.text),
            const SizedBox(
              width: 300,
              height: 600,
              child: TextField(
                // controller: viewModel.textEditingController,
                // ignore: unnecessary_const
                decoration: const InputDecoration(
                  hintText: "入力してください",
                ),
                autofocus: true, //ページ遷移時に自動フォーカス
                maxLines: null,
                textAlign: TextAlign.left,
              ),
            ),
            SafeArea(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                child: const Text('カンペを追加'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
