import 'package:campe_app/view/new_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampeTile extends ConsumerWidget {
  const CampeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campe = ref.watch(currentCampeProvider);
    return ListTile(
      title: Text(campe.name),
      //TODO: implement update.
      onTap: () {},
      //TODO: implement delete.
      onLongPress: () {},
    );
  }
}
