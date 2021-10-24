import 'package:flutter/material.dart';

import '../reference.dart';

class AddingPage extends StatelessWidget {
  AddingPage({Key? key}) : super(key: key);

  final TextEditingController textController
    = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              width: 300,
              height: 600,
              child: TextField(
                controller: textController,
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
                onPressed: () {
                  //  firestoreにadd
                  campe.add({'content': textController.text});
                  textController.clear();
                },
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
