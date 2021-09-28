import '../model/campe_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CampeListProvider = StateNotifierProvider<CampeListViewModel, CampeList>(
  (ref) => CampeListViewModel(),
);

class CampeListViewModel extends StateNotifier<CampeList> {
  CampeListViewModel() : super(const CampeList());

  void createCampe(String text) {
    //TODO処理を書く。
  }
  void deleteCampe(int id) {
    //TODO処理を書く
  }
  void updateCampe(int id, String text) {
    //TODO処理を書く
  }
}
