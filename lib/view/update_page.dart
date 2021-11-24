import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key, required this.oldText}) : super(key: key);
  final String oldText;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.oldText);
  }

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
              Navigator.pop(context, widget.oldText);
            }),
        title: const Text('編集'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.surprise,
              size:100),
              SizedBox(
                width: 300,
                height: 100,
                child: TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  maxLines: null,
                  textAlign: TextAlign.left
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_textEditingController.text == "") {
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
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  } else {
                    Navigator.pop(context, _textEditingController.text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                child: const Text('編集を適用'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
