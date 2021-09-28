import 'package:freezed_annotation/freezed_annotation.dart';

part 'campe_model.freezed.dart';

@freezed
class CampeModel with _$CampeModel {
  const factory CampeModel({
    @Default(0) int id,
    @Default('') String text,
  }) = _CampeModel;
}
