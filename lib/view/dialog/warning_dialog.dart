import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:campe_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WarningDialog extends ConsumerWidget {
  const WarningDialog({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => const WarningDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('アプリを退会しますか？', style: TextStyle(fontSize: 20)),
            const Text('データはすべて消去されます'),
            const SizedBox(height: 12),
            const SizedBox(width: double.infinity),
            ElevatedButton(
              onPressed: () {
                ref.read(authControllerProvider.notifier).deleteUser();
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterScreen();
                    },
                  ),
                  (route) => false,
                );
              },
              child: const Text('はい'),
            ),
          ],
        ),
      ),
    );
  }
}
