import 'package:campe_app/exception/campe_list_exception_provider.dart';
import 'package:campe_app/exception/custom_exception.dart';
import 'package:campe_app/model/campe_model.dart';
import 'package:campe_app/repositories/campe_repositories/campe_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampeListController extends StateNotifier<AsyncValue<List<Campe>>> {
  final Reader _read;
  final String? _userId;

  CampeListController(this._read, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retriveCampes();
    }
  }

  // カンペを取得
  Future<void> retriveCampes({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final campes =
          await _read(campeRepositoryProvider).retriveCampes(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(campes);
      }
    } on CustomException catch (error, st) {
      state = AsyncValue.error(error, stackTrace: st);
    }
  }

  // カンペを追加
  Future<void> addCampe({required String name}) async {
    try {
      final campe = Campe(name: name);
      final campeId = await _read(campeRepositoryProvider).createCampe(
        userId: _userId!,
        campe: campe,
        createdAt: DateTime.now(),
      );
      state.whenData((campes) =>
          state = AsyncValue.data(campes..add(campe.copyWith(id: campeId))));
    } on CustomException catch (error) {
      _read(campeListExceptionProvider.notifier).state = error;
    }
  }

  // カンペを編集
  Future<void> updateCampe({required Campe updatedCampe}) async {
    try {
      await _read(campeRepositoryProvider).updateCampe(
        userId: _userId!,
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

  // カンペを削除
  Future<void> deleteItem({required String campeId}) async {
    try {
      await _read(campeRepositoryProvider).deleteCampe(
        userId: _userId!,
        campeId: campeId,
      );
      state.whenData((campes) {
        state = AsyncValue.data(
            campes..removeWhere((campe) => campe.id == campeId));
      });
    } on CustomException catch (error) {
      _read(campeListExceptionProvider.state).state = error;
    }
  }
}
