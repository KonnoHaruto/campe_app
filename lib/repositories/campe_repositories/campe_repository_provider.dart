import 'package:campe_app/repositories/campe_repositories/campe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final campeRepositoryProvider = 
    Provider<CampeRepository>((ref) => CampeRepository(ref.read));
