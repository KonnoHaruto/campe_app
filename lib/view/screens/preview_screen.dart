import 'package:campe_app/controller/campe_list_controller/campe_lsit_controller_provider.dart';
import 'package:campe_app/exception/custom_exception.dart';
import 'package:campe_app/view/campe_list_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreviewScreen extends ConsumerWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campeState = ref.watch(campeListControllerProvider);
    return Scaffold(
      body: campeState.when(
        data: (campes) => campes.isEmpty
            ? const Center(
                child: Text(
                  '＋ボタンを押してカンペを作成',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: campeState.value?.length,
                itemBuilder: (BuildContext context, int index) {
                  final campe = campes[index];
                  return ListTile(
                    title: Center(
                      child: Text(campe.name, 
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  );
                }),
        error: (error, _) => CampeListError(
          message: error is CustomException
          ? error.message!
          : 'Something went wrong!',
        ),
        loading: () => const Center(child: CircularProgressIndicator())
      ),
    );
  }
}
