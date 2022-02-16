import 'package:campe_app/my_app.dart';
import 'package:campe_app/repositories/package_info_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  late final PackageInfo packageInfo;
  await Future.wait([
    Future  (()async => packageInfo =  await PackageInfo.fromPlatform()),
    Firebase.initializeApp(),
  ]);
  runApp(
    ProviderScope(
      overrides: [
        packageInfoRepositoryProvider
            .overrideWithValue(PackageInfoRepository(packageInfo)),
      ],
      child: const MyApp(),
    ),
  );
}
