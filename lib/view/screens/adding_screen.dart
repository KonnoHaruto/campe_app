import 'package:campe_app/alert_dialog.dart';
import 'package:campe_app/controller/campe_list_controller/campe_lsit_controller_provider.dart';
import 'package:campe_app/view/appBar/adding_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddingScreen extends ConsumerWidget {
  const AddingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _textControler = TextEditingController();
    late final notEnterd = _textControler.text == "";
    return Scaffold(
      appBar: addingScreenAppBar(context),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: TextField(
                      cursorColor: Colors.indigo,
                      controller: _textControler,
                      decoration: const InputDecoration(
                        hintText: "ここに入力",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                      autofocus: true,
                      maxLines: null,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (notEnterd) {
            alertDialog(context);
          } else {
            ref
                .read(campeListControllerProvider.notifier)
                .addCampe(name: _textControler.text.trim());
            _textControler.clear();
            Navigator.of(context).pop();
          }
        },
        child: const FaIcon(FontAwesomeIcons.check),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
