import 'package:campe_app/view/home_bandller.dart';
import 'package:campe_app/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';

class AddingPage extends ConsumerWidget {
  const AddingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(CampeListProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text('カンペ作成ページ'),
          backgroundColor: Colors.teal.withOpacity(0.5),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(viewModel.textEditingController.text),
              SizedBox(
                width: 300,
                height: 60,
                child: TextField(
                  controller: viewModel.textEditingController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.createCampe(viewModel.textEditingController.text);
                  viewModel.textEditingController.clear();
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const HomePage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                child: const Text('カンペを追加'),
              ),
            ],
          ),
        ));
  }
}
