import 'package:campe_app/controller/campe_list_controller/campe_lsit_controller_provider.dart';
import 'package:campe_app/model/campe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MakingScreen extends HookConsumerWidget {
  const MakingScreen({
    Key? key,
    this.campe,
  }) : super(key: key);

  final Campe? campe;
  bool get data => campe != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useState<TextEditingController>(
      TextEditingController(text: campe?.name),
    );
    return Scaffold(
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
        title: Text(data ? 'カンペを編集' : 'カンペを作成'),
        backgroundColor: Colors.indigo,
      ),
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
                      controller: nameController.value,
                      decoration: const InputDecoration(
                        hintText: 'ここに入力',
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
          if (data) {
            final id = campe?.id;
            if (id == null) {
              return;
            }
            ref.read(campeListControllerProvider.notifier).updateCampe(
                  updatedCampe: Campe(
                    id: id,
                    name: nameController.value.text,
                  ),
                );
            nameController.value.clear();
            Navigator.of(context).pop();
            return;
          }
          ref.read(campeListControllerProvider.notifier).addCampe(
                name: nameController.value.text,
              );
          nameController.value.clear();
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.indigo,
        child: const FaIcon(FontAwesomeIcons.check),
      ),
    );
  }
}
