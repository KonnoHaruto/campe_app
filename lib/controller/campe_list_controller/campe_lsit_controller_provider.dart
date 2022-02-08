import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:campe_app/controller/campe_list_controller/campe_list_controller.dart';
import 'package:campe_app/model/campe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final campeListControllerProvider =
    StateNotifierProvider<CampeListController, AsyncValue<List<Campe>>>((ref) {
  final user = ref.watch(authControllerProvider);
  if (user == null) {
    throw UnimplementedError();
  }
  return CampeListController(ref.read, user.uid)..retriveCampes();
});
