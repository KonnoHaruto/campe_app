import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../reference.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 90,
        leading: TextButton(
          child: const Text(
            'キャンセル',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('カンペ作成'),
      ),
      body: SafeArea(
        child: Center(
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
                    hintText: "ここに入力",
                  ),
                  autofocus: true, //ページ遷移時に自動フォーカス
                  maxLines: null,
                  textAlign: TextAlign.left,
                ),
              ),
              SafeArea(
                child: ElevatedButton(
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
                                  child: const Text('OK'),
                                  isDestructiveAction: false,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      campeRef.add({
                        'content': textController.text,
                        'createdAt': DateTime.now(),
                      });
                      textController.clear();
                      Navigator.pop(context);
                    }
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
      ),
    );
  }
}
