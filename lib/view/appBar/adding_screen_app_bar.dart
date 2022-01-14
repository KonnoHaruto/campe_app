import 'package:flutter/material.dart';

AppBar addingScreenAppBar(BuildContext context) {
    return AppBar(
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
    );
  }