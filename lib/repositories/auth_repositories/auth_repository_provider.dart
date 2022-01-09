import 'package:campe_app/repositories/auth_repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = 
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));