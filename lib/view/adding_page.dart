import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reference.dart';

class AddingPage extends StatelessWidget {
  AddingPage({Key? key}) : super(key: key);

  // インスタンスを他のクラスでも使いたい。
  // -> 詰まるところコンストラクタにこれがないといかん。。
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カンペ作成'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                // Is it true?? Huum.. I think boar code it is.
                onPressed: () {
                  if (textController.text == "") {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return CupertinoAlertDialog(
                            title: const Text('テキストが未入力です'),
                            content: const Text('テキストの入力を完了させてください'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Ok'),
                                isDestructiveAction: false,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  }
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
