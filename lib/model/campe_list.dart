import 'package:campe_app/model/campe_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campe_list.freezed.dart';

@freezed
class CampeList with _$CampeList {
  const factory CampeList({
    @Default(<CampeModel>[]) List<CampeModel> campeList,
  }) = _CampeList;
}
