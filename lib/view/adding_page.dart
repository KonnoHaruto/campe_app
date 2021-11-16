import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:campe_app/reference.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final textController = TextEditingController();

  bool showSpiner = false;

  void startSpiner() {
    setState(() {
      showSpiner = true;
    });
  }

  void stopSpiner() {
    setState(() {
      showSpiner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カンペ作成'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
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
                    startSpiner();
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
                                    stopSpiner();
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      final now = DateTime.now();
                      campeRef.add({'content': textController.text, 'createdAt': now});
                      textController.clear();
                      Navigator.pop(context);
                      stopSpiner();
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
