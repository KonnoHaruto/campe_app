import 'package:campe_app/controller/campe_list_controller/campe_lsit_controller_provider.dart';
import 'package:campe_app/exception/custom_exception.dart';
import 'package:campe_app/model/campe_model.dart';
import 'package:campe_app/view/campe_list_error.dart';
import 'package:campe_app/view/campe_tile.dart';
import 'package:campe_app/view/appBar/home_screen_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final currentCampeProvider = Provider<Campe>((_) => throw UnimplementedError());

class NewHomeScreen extends ConsumerWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campeListState = ref.watch(campeListControllerProvider);
    return Scaffold(
      appBar: homeScreenAppBar(context, ref),
      body: campeListState.when(
        data: (campes) => campes.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    FaIcon(FontAwesomeIcons.paperclip, size: 150),
                    SizedBox(height: 20,),
                    Text(
                      '＋ボタンを押してカンペを作成',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: campes.length,
                itemBuilder: (BuildContext context, int index) {
                  final campe = campes[index];
                  return ProviderScope(
                    overrides: [currentCampeProvider.overrideWithValue(campe)],
                    child: const CampeTile(),
                  );
                }),
        error: (error, _) => CampeListError(
          message: error is CustomException
              ? error.message!
              : 'Something went wrrong!!',
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}