import 'package:campe_app/controller/campe_list_controller/campe_lsit_controller_provider.dart';
import 'package:campe_app/view/screens/making_screen.dart';
import 'package:campe_app/view/widgets/campe_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampeTile extends ConsumerWidget {
  const CampeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campe = ref.watch(currentCampeProvider);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      child: ListTile(
        title: Text(campe.name),
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MakingScreen(campe: campe);
              },
            ),
          );
        },
        onLongPress: () {
          final id = campe.id;
          if (id == null) {
            return;
          }
          ref
              .read(campeListControllerProvider.notifier)
              .deleteCampe(campeId: id);
        },
      ),
    );
  }
}
