import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  UpdatePage({Key? key, required this.testTitle}) : super(key: key);

    final String testTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                controller: TextEditingController(text: testTitle),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                TextEditingController().clear();
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
