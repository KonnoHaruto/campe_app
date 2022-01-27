import 'package:campe_app/exception/custom_exception.dart';
import 'package:campe_app/extension/firestore_extension.dart';
import 'package:campe_app/firebase_instance_provider.dart';
import 'package:campe_app/model/campe_model.dart';
import 'package:campe_app/repositories/campe_repositories/base_campe_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampeRepository implements BaseCampeRepository {
  final Reader _read;
  const CampeRepository(this._read);

  @override
  Future<String> createCampe({
    required String userId,
    required Campe campe,
  }) async {
    try {
      final docRef =
          await _read(firebaseFirestoreProvider).userListRef(userId).add(campe.toDocument());
      return docRef.id;
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message);
    }
  }

  @override
  Future<void> deleteCampe({
    required String userId,
    required String campeId,
  }) async {
    try {
      await _read(firebaseFirestoreProvider)
          .userListRef(userId)
          .doc(campeId)
          .delete();
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message);
    }
  }

  @override
  Future<List<Campe>> retriveCampes({required String userId}) async {
    try {
      final snap =
          await _read(firebaseFirestoreProvider).userListRef(userId).orderBy('createdAt').get();

      return snap.docs.map((doc) {
        return Campe.fromDocument(doc);
      }).toList();
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message);
    }
  }

  @override
  Future<void> updateCampe({
    required String userId,
    required Campe campe,
  }) async {
    try {
      await _read(firebaseFirestoreProvider)
          .userListRef(userId)
          .doc(campe.id)
          .update(campe.toDocument());
    } on FirebaseException catch (error) {
      throw CustomException(message: error.message);
    }
  }
}
