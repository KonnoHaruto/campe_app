import 'package:campe_app/exception/custom_exception.dart';
import 'package:campe_app/firebase_instance_provider.dart';
import 'package:campe_app/repositories/auth_repositories/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository implements BaseAuthRepository {
  const AuthRepository(this._read);
  final Reader _read;

  @override
  Stream<User?> get authStateChanges =>
      _read(firebaseAuthProvider).authStateChanges();

  @override
  User? getCurrentUser() {
    try {
      return _read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (error) {
      throw CustomException(message: error.message);
    }
  }

  @override
  Future<void> signInAnoymously() async {
    try {
      await _read(firebaseAuthProvider).signInAnonymously();
    } on FirebaseAuthException catch (error) {
      throw CustomException(message: error.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (error) {
      throw CustomException(message: error.message);
    }
  }
}
