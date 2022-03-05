import 'package:campe_app/model/campe_model.dart';

abstract class BaseCampeRepository {
  Future<List<Campe>> retriveCampes({required String userId});
  Future<String> createCampe({
    required String userId,
    required Campe campe,
  });
  Future<void> updateCampe({required String userId, required Campe campe});
  Future<void> deleteCampe({required String userId, required String campeId});
}
