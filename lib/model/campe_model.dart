import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'campe_model.freezed.dart';
part 'campe_model.g.dart';

@freezed
abstract class Campe with _$Campe {
  const Campe._();

  const factory Campe({
    String? id,
    required String name,
  }) = _Campe;

  factory Campe.fromJson(Map<String, dynamic> json) => _$CampeFromJson(json);

  factory Campe.empty() => const Campe(name: '');

  factory Campe.fromDocument(dynamic doc) {
    final data = doc.data()!;
    return Campe.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
