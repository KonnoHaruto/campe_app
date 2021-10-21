import 'package:flutter/material.dart';

import '../model/campe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/campe_list.dart';

final campeListProvider = StateNotifierProvider<HomePageViewModel, CampeList>(
  (ref) => HomePageViewModel(),
);

class HomePageViewModel extends StateNotifier<CampeList> {
  HomePageViewModel() : super(const CampeList());

  final textEditingController = TextEditingController();

//カンペを作成
  void createCampe(String text) {
    final campe = CampeModel(id: state.campeList.length + 1, text: text);
    final newList = [
      campe,
      ...state.campeList,
    ];
    state = state.copyWith(campeList: newList);
  }

// カンペを削除
  void deleteCampe(int id) {
    final deletedList =
        state.campeList.where((campe) => campe.id != id).toList();
    state = state.copyWith(campeList: deletedList);
  }

// カンペを編集
  void updateCampe(int id, String text) {
    final updatedList = state.campeList
        .map((campe) => campe.id == id ? CampeModel(text: text) : campe)
        .toList();
    state = state.copyWith(campeList: updatedList);
  }
}
