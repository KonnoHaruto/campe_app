// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'campe_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CampeListTearOff {
  const _$CampeListTearOff();

  _CampeList call({List<CampeModel> campeList = const <CampeModel>[]}) {
    return _CampeList(
      campeList: campeList,
    );
  }
}

/// @nodoc
const $CampeList = _$CampeListTearOff();

/// @nodoc
mixin _$CampeList {
  List<CampeModel> get campeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CampeListCopyWith<CampeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampeListCopyWith<$Res> {
  factory $CampeListCopyWith(CampeList value, $Res Function(CampeList) then) =
      _$CampeListCopyWithImpl<$Res>;
  $Res call({List<CampeModel> campeList});
}

/// @nodoc
class _$CampeListCopyWithImpl<$Res> implements $CampeListCopyWith<$Res> {
  _$CampeListCopyWithImpl(this._value, this._then);

  final CampeList _value;
  // ignore: unused_field
  final $Res Function(CampeList) _then;

  @override
  $Res call({
    Object? campeList = freezed,
  }) {
    return _then(_value.copyWith(
      campeList: campeList == freezed
          ? _value.campeList
          : campeList // ignore: cast_nullable_to_non_nullable
              as List<CampeModel>,
    ));
  }
}

/// @nodoc
abstract class _$CampeListCopyWith<$Res> implements $CampeListCopyWith<$Res> {
  factory _$CampeListCopyWith(
          _CampeList value, $Res Function(_CampeList) then) =
      __$CampeListCopyWithImpl<$Res>;
  @override
  $Res call({List<CampeModel> campeList});
}

/// @nodoc
class __$CampeListCopyWithImpl<$Res> extends _$CampeListCopyWithImpl<$Res>
    implements _$CampeListCopyWith<$Res> {
  __$CampeListCopyWithImpl(_CampeList _value, $Res Function(_CampeList) _then)
      : super(_value, (v) => _then(v as _CampeList));

  @override
  _CampeList get _value => super._value as _CampeList;

  @override
  $Res call({
    Object? campeList = freezed,
  }) {
    return _then(_CampeList(
      campeList: campeList == freezed
          ? _value.campeList
          : campeList // ignore: cast_nullable_to_non_nullable
              as List<CampeModel>,
    ));
  }
}

/// @nodoc

class _$_CampeList implements _CampeList {
  const _$_CampeList({this.campeList = const <CampeModel>[]});

  @JsonKey(defaultValue: const <CampeModel>[])
  @override
  final List<CampeModel> campeList;

  @override
  String toString() {
    return 'CampeList(campeList: $campeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CampeList &&
            (identical(other.campeList, campeList) ||
                const DeepCollectionEquality()
                    .equals(other.campeList, campeList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(campeList);

  @JsonKey(ignore: true)
  @override
  _$CampeListCopyWith<_CampeList> get copyWith =>
      __$CampeListCopyWithImpl<_CampeList>(this, _$identity);
}

abstract class _CampeList implements CampeList {
  const factory _CampeList({List<CampeModel> campeList}) = _$_CampeList;

  @override
  List<CampeModel> get campeList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CampeListCopyWith<_CampeList> get copyWith =>
      throw _privateConstructorUsedError;
}
