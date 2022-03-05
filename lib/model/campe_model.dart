import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campe_model.freezed.dart';
part 'campe_model.g.dart';

@freezed
abstract class Campe with _$Campe {
  const factory Campe({
    String? id,
    required String name,
    @TimestampConverter() DateTime? createdAt,
  }) = _Campe;

  const Campe._();

  factory Campe.fromJson(Map<String, dynamic>? json) => _$CampeFromJson(json!);

  factory Campe.empty() => const Campe(name: '');

  factory Campe.fromDocument(QueryDocumentSnapshot<Object?> doc) {
    final data = doc.data();
    final castedData = data as Map<String, dynamic>?;
    return Campe.fromJson(castedData).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
