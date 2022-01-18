  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> alertDialog(BuildContext context) {
    return showDialog(
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
  }
