import 'package:campe_app/exception/campe_list_exception_provider.dart';
import 'package:campe_app/exception/custom_exception.dart';
import 'package:campe_app/model/campe_model.dart';
import 'package:campe_app/repositories/campe_repositories/campe_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampeListController extends StateNotifier<AsyncValue<List<Campe>>> {
  CampeListController(this._read, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retriveCampes();
    }
  }

  final Reader _read;
  final String? _userId;

  Future<void> retriveCampes({bool isRefreshing = false}) async {
    if (isRefreshing) {
      state = const AsyncValue.loading();
    }
    try {
      final userId = _userId;
      if (userId == null) {
        return;
      }
      final campes =
          await _read(campeRepositoryProvider).retriveCampes(userId: userId);
      if (mounted) {
        state = AsyncValue.data(campes);
      }
    } on CustomException catch (error, st) {
      state = AsyncValue.error(error, stackTrace: st);
    }
  }

  Future<void> addCampe({
    required String name,
    required DateTime createdAt,
  }) async {
    try {
      final campe = Campe(name: name, createdAt: createdAt);
      final userId = _userId;
      if (userId == null) {
        return;
      }
      final campeId = await _read(campeRepositoryProvider).createCampe(
        userId: userId,
        campe: campe,
      );
      state.whenData(
        (campes) => state = AsyncValue.data(
          campes
            ..add(
              campe.copyWith(id: campeId),
            ),
        ),
      );
    } on CustomException catch (error) {
      _read(campeListExceptionProvider.notifier).state = error;
    }
  }

  Future<void> updateCampe({required Campe updatedCampe}) async {
    try {
      final userId = _userId;
      if (userId == null) {
        return;
      }
      await _read(campeRepositoryProvider).updateCampe(
        userId: userId,
        campe: updatedCampe,
      );
      state.whenData((campes) {
        state = AsyncValue.data([
          for (final campe in campes)
            if (campe.id == updatedCampe.id) updatedCampe else campe
        ]);
      });
    } on CustomException catch (error) {
      _read(campeListExceptionProvider.notifier).state = error;
    }
  }

  Future<void> deleteCampe({required String campeId}) async {
    try {
      final userId = _userId;
      if (userId == null) {
        return;
      }
      await _read(campeRepositoryProvider).deleteCampe(
        userId: userId,
        campeId: campeId,
      );
      state.whenData((campes) {
        state = AsyncValue.data(
          campes..removeWhere((campe) => campe.id == campeId),
        );
      });
    } on CustomException catch (error) {
      _read(campeListExceptionProvider.state).state = error;
    }
  }
}
