import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePage extends ConsumerWidget {
  const UpdatePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
            const SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                // controller: viewModel.textEditingController,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
