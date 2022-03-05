// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'campe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Campe _$CampeFromJson(Map<String, dynamic> json) {
  return _Campe.fromJson(json);
}

/// @nodoc
class _$CampeTearOff {
  const _$CampeTearOff();

  _Campe call({String? id, required String name}) {
    return _Campe(
      id: id,
      name: name,
    );
  }

  Campe fromJson(Map<String, Object?> json) {
    return Campe.fromJson(json);
  }
}

/// @nodoc
const $Campe = _$CampeTearOff();

/// @nodoc
mixin _$Campe {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CampeCopyWith<Campe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampeCopyWith<$Res> {
  factory $CampeCopyWith(Campe value, $Res Function(Campe) then) =
      _$CampeCopyWithImpl<$Res>;
  $Res call({String? id, String name});
}

/// @nodoc
class _$CampeCopyWithImpl<$Res> implements $CampeCopyWith<$Res> {
  _$CampeCopyWithImpl(this._value, this._then);

  final Campe _value;
  // ignore: unused_field
  final $Res Function(Campe) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CampeCopyWith<$Res> implements $CampeCopyWith<$Res> {
  factory _$CampeCopyWith(_Campe value, $Res Function(_Campe) then) =
      __$CampeCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String name});
}

/// @nodoc
class __$CampeCopyWithImpl<$Res> extends _$CampeCopyWithImpl<$Res>
    implements _$CampeCopyWith<$Res> {
  __$CampeCopyWithImpl(_Campe _value, $Res Function(_Campe) _then)
      : super(_value, (v) => _then(v as _Campe));

  @override
  _Campe get _value => super._value as _Campe;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Campe(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Campe extends _Campe with DiagnosticableTreeMixin {
  const _$_Campe({this.id, required this.name}) : super._();

  factory _$_Campe.fromJson(Map<String, dynamic> json) =>
      _$$_CampeFromJson(json);

  @override
  final String? id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Campe(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Campe'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Campe &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$CampeCopyWith<_Campe> get copyWith =>
      __$CampeCopyWithImpl<_Campe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CampeToJson(this);
  }
}

abstract class _Campe extends Campe {
  const factory _Campe({String? id, required String name}) = _$_Campe;
  const _Campe._() : super._();

  factory _Campe.fromJson(Map<String, dynamic> json) = _$_Campe.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$CampeCopyWith<_Campe> get copyWith => throw _privateConstructorUsedError;
}
