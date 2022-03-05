// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Campe _$$_CampeFromJson(Map<String, dynamic> json) => _$_Campe(
      id: json['id'] as String?,
      name: json['name'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_CampeToJson(_$_Campe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
