// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'campe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CampeModelTearOff {
  const _$CampeModelTearOff();

  _CampeModel call({int id = 0, String text = ''}) {
    return _CampeModel(
      id: id,
      text: text,
    );
  }
}

/// @nodoc
const $CampeModel = _$CampeModelTearOff();

/// @nodoc
mixin _$CampeModel {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CampeModelCopyWith<CampeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampeModelCopyWith<$Res> {
  factory $CampeModelCopyWith(
          CampeModel value, $Res Function(CampeModel) then) =
      _$CampeModelCopyWithImpl<$Res>;
  $Res call({int id, String text});
}

/// @nodoc
class _$CampeModelCopyWithImpl<$Res> implements $CampeModelCopyWith<$Res> {
  _$CampeModelCopyWithImpl(this._value, this._then);

  final CampeModel _value;
  // ignore: unused_field
  final $Res Function(CampeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CampeModelCopyWith<$Res> implements $CampeModelCopyWith<$Res> {
  factory _$CampeModelCopyWith(
          _CampeModel value, $Res Function(_CampeModel) then) =
      __$CampeModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String text});
}

/// @nodoc
class __$CampeModelCopyWithImpl<$Res> extends _$CampeModelCopyWithImpl<$Res>
    implements _$CampeModelCopyWith<$Res> {
  __$CampeModelCopyWithImpl(
      _CampeModel _value, $Res Function(_CampeModel) _then)
      : super(_value, (v) => _then(v as _CampeModel));

  @override
  _CampeModel get _value => super._value as _CampeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
  }) {
    return _then(_CampeModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CampeModel implements _CampeModel {
  const _$_CampeModel({this.id = 0, this.text = ''});

  @JsonKey(defaultValue: 0)
  @override
  final int id;
  @JsonKey(defaultValue: '')
  @override
  final String text;

  @override
  String toString() {
    return 'CampeModel(id: $id, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CampeModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$CampeModelCopyWith<_CampeModel> get copyWith =>
      __$CampeModelCopyWithImpl<_CampeModel>(this, _$identity);
}

abstract class _CampeModel implements CampeModel {
  const factory _CampeModel({int id, String text}) = _$_CampeModel;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CampeModelCopyWith<_CampeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
