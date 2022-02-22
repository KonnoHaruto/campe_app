import 'package:campe_app/repositories/package_info_repository.dart';
import 'package:campe_app/view/dialog/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appVersion = ref.watch(packageInfoRepositoryProvider).appVersion;
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定画面'),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.info),
              title: const Text('アプリバージョン'),
              subtitle: Text(appVersion),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.signOutAlt),
              title: const Text('アプリを退会'),
              onTap: () => WarningDialog.show(context),
            ),
          ],
        ),
      ),
    );
  }
}
