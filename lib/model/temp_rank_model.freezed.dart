// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temp_rank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TempRankData _$TempRankDataFromJson(Map<String, dynamic> json) {
  return _TempRankData.fromJson(json);
}

/// @nodoc
mixin _$TempRankData {
  List<int> get ranks => throw _privateConstructorUsedError;
  int get raceNum => throw _privateConstructorUsedError;
  String get raceName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TempRankDataCopyWith<TempRankData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempRankDataCopyWith<$Res> {
  factory $TempRankDataCopyWith(
          TempRankData value, $Res Function(TempRankData) then) =
      _$TempRankDataCopyWithImpl<$Res>;
  $Res call({List<int> ranks, int raceNum, String raceName});
}

/// @nodoc
class _$TempRankDataCopyWithImpl<$Res> implements $TempRankDataCopyWith<$Res> {
  _$TempRankDataCopyWithImpl(this._value, this._then);

  final TempRankData _value;
  // ignore: unused_field
  final $Res Function(TempRankData) _then;

  @override
  $Res call({
    Object? ranks = freezed,
    Object? raceNum = freezed,
    Object? raceName = freezed,
  }) {
    return _then(_value.copyWith(
      ranks: ranks == freezed
          ? _value.ranks
          : ranks // ignore: cast_nullable_to_non_nullable
              as List<int>,
      raceNum: raceNum == freezed
          ? _value.raceNum
          : raceNum // ignore: cast_nullable_to_non_nullable
              as int,
      raceName: raceName == freezed
          ? _value.raceName
          : raceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TempRankDataCopyWith<$Res>
    implements $TempRankDataCopyWith<$Res> {
  factory _$$_TempRankDataCopyWith(
          _$_TempRankData value, $Res Function(_$_TempRankData) then) =
      __$$_TempRankDataCopyWithImpl<$Res>;
  @override
  $Res call({List<int> ranks, int raceNum, String raceName});
}

/// @nodoc
class __$$_TempRankDataCopyWithImpl<$Res>
    extends _$TempRankDataCopyWithImpl<$Res>
    implements _$$_TempRankDataCopyWith<$Res> {
  __$$_TempRankDataCopyWithImpl(
      _$_TempRankData _value, $Res Function(_$_TempRankData) _then)
      : super(_value, (v) => _then(v as _$_TempRankData));

  @override
  _$_TempRankData get _value => super._value as _$_TempRankData;

  @override
  $Res call({
    Object? ranks = freezed,
    Object? raceNum = freezed,
    Object? raceName = freezed,
  }) {
    return _then(_$_TempRankData(
      ranks: ranks == freezed
          ? _value._ranks
          : ranks // ignore: cast_nullable_to_non_nullable
              as List<int>,
      raceNum: raceNum == freezed
          ? _value.raceNum
          : raceNum // ignore: cast_nullable_to_non_nullable
              as int,
      raceName: raceName == freezed
          ? _value.raceName
          : raceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TempRankData implements _TempRankData {
  const _$_TempRankData(
      {final List<int> ranks = const [2], this.raceNum = 0, this.raceName = ""})
      : _ranks = ranks;

  factory _$_TempRankData.fromJson(Map<String, dynamic> json) =>
      _$$_TempRankDataFromJson(json);

  final List<int> _ranks;
  @override
  @JsonKey()
  List<int> get ranks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ranks);
  }

  @override
  @JsonKey()
  final int raceNum;
  @override
  @JsonKey()
  final String raceName;

  @override
  String toString() {
    return 'TempRankData(ranks: $ranks, raceNum: $raceNum, raceName: $raceName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempRankData &&
            const DeepCollectionEquality().equals(other._ranks, _ranks) &&
            const DeepCollectionEquality().equals(other.raceNum, raceNum) &&
            const DeepCollectionEquality().equals(other.raceName, raceName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ranks),
      const DeepCollectionEquality().hash(raceNum),
      const DeepCollectionEquality().hash(raceName));

  @JsonKey(ignore: true)
  @override
  _$$_TempRankDataCopyWith<_$_TempRankData> get copyWith =>
      __$$_TempRankDataCopyWithImpl<_$_TempRankData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TempRankDataToJson(this);
  }
}

abstract class _TempRankData implements TempRankData {
  const factory _TempRankData(
      {final List<int> ranks,
      final int raceNum,
      final String raceName}) = _$_TempRankData;

  factory _TempRankData.fromJson(Map<String, dynamic> json) =
      _$_TempRankData.fromJson;

  @override
  List<int> get ranks => throw _privateConstructorUsedError;
  @override
  int get raceNum => throw _privateConstructorUsedError;
  @override
  String get raceName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TempRankDataCopyWith<_$_TempRankData> get copyWith =>
      throw _privateConstructorUsedError;
}
