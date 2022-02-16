import 'dart:async';

import 'package:campe_app/repositories/auth_repositories/auth_repository_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<User?> {
  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((User? user) => state = user);
  }

  final Reader _read;
  StreamSubscription<User?>? _authStateChangesSubscription;

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  bool isLoggedIn() {
    final user = _read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      return false;
    }
    return true;
  }

  User? getCurrentUser() {
    final user = _read(authRepositoryProvider).getCurrentUser();
    return user;
  }

  Future<void> signOutAndDelete() async {
    await _read(authRepositoryProvider).getCurrentUser()!.delete();
  }

  Future<void> signInAnoymously() async {
    await _read(authRepositoryProvider).signInAnoymously();
  }
}
