import 'package:campe_app/controller/campe_list_controller/campe_lsit_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampeListError extends ConsumerWidget {
  const CampeListError({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => ref
                .read(campeListControllerProvider.notifier)
                .retriveCampes(isRefreshing: true),
            child: const Text('再試行'),
          )
        ],
      ),
    );
  }
}
