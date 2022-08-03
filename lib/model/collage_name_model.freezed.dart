// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'collage_name_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollageNameData _$CollageNameDataFromJson(Map<String, dynamic> json) {
  return _CollageNameData.fromJson(json);
}

/// @nodoc
mixin _$CollageNameData {
  String get uid => throw _privateConstructorUsedError;
  int get yachtNum => throw _privateConstructorUsedError;
  String get collageName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollageNameDataCopyWith<CollageNameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollageNameDataCopyWith<$Res> {
  factory $CollageNameDataCopyWith(
          CollageNameData value, $Res Function(CollageNameData) then) =
      _$CollageNameDataCopyWithImpl<$Res>;
  $Res call({String uid, int yachtNum, String collageName});
}

/// @nodoc
class _$CollageNameDataCopyWithImpl<$Res>
    implements $CollageNameDataCopyWith<$Res> {
  _$CollageNameDataCopyWithImpl(this._value, this._then);

  final CollageNameData _value;
  // ignore: unused_field
  final $Res Function(CollageNameData) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? yachtNum = freezed,
    Object? collageName = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      yachtNum: yachtNum == freezed
          ? _value.yachtNum
          : yachtNum // ignore: cast_nullable_to_non_nullable
              as int,
      collageName: collageName == freezed
          ? _value.collageName
          : collageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CollageNameDataCopyWith<$Res>
    implements $CollageNameDataCopyWith<$Res> {
  factory _$$_CollageNameDataCopyWith(
          _$_CollageNameData value, $Res Function(_$_CollageNameData) then) =
      __$$_CollageNameDataCopyWithImpl<$Res>;
  @override
  $Res call({String uid, int yachtNum, String collageName});
}

/// @nodoc
class __$$_CollageNameDataCopyWithImpl<$Res>
    extends _$CollageNameDataCopyWithImpl<$Res>
    implements _$$_CollageNameDataCopyWith<$Res> {
  __$$_CollageNameDataCopyWithImpl(
      _$_CollageNameData _value, $Res Function(_$_CollageNameData) _then)
      : super(_value, (v) => _then(v as _$_CollageNameData));

  @override
  _$_CollageNameData get _value => super._value as _$_CollageNameData;

  @override
  $Res call({
    Object? uid = freezed,
    Object? yachtNum = freezed,
    Object? collageName = freezed,
  }) {
    return _then(_$_CollageNameData(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      yachtNum: yachtNum == freezed
          ? _value.yachtNum
          : yachtNum // ignore: cast_nullable_to_non_nullable
              as int,
      collageName: collageName == freezed
          ? _value.collageName
          : collageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CollageNameData implements _CollageNameData {
  const _$_CollageNameData(
      {this.uid = "", this.yachtNum = 1000, this.collageName = ""});

  factory _$_CollageNameData.fromJson(Map<String, dynamic> json) =>
      _$$_CollageNameDataFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final int yachtNum;
  @override
  @JsonKey()
  final String collageName;

  @override
  String toString() {
    return 'CollageNameData(uid: $uid, yachtNum: $yachtNum, collageName: $collageName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollageNameData &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.yachtNum, yachtNum) &&
            const DeepCollectionEquality()
                .equals(other.collageName, collageName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(yachtNum),
      const DeepCollectionEquality().hash(collageName));

  @JsonKey(ignore: true)
  @override
  _$$_CollageNameDataCopyWith<_$_CollageNameData> get copyWith =>
      __$$_CollageNameDataCopyWithImpl<_$_CollageNameData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollageNameDataToJson(this);
  }
}

abstract class _CollageNameData implements CollageNameData {
  const factory _CollageNameData(
      {final String uid,
      final int yachtNum,
      final String collageName}) = _$_CollageNameData;

  factory _CollageNameData.fromJson(Map<String, dynamic> json) =
      _$_CollageNameData.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  int get yachtNum => throw _privateConstructorUsedError;
  @override
  String get collageName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CollageNameDataCopyWith<_$_CollageNameData> get copyWith =>
      throw _privateConstructorUsedError;
}
