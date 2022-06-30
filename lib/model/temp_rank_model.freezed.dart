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

/// @nodoc
mixin _$TempRankData {
  List<int> get ranks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempRankDataCopyWith<TempRankData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempRankDataCopyWith<$Res> {
  factory $TempRankDataCopyWith(
          TempRankData value, $Res Function(TempRankData) then) =
      _$TempRankDataCopyWithImpl<$Res>;
  $Res call({List<int> ranks});
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
  }) {
    return _then(_value.copyWith(
      ranks: ranks == freezed
          ? _value.ranks
          : ranks // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
  $Res call({List<int> ranks});
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
  }) {
    return _then(_$_TempRankData(
      ranks: ranks == freezed
          ? _value._ranks
          : ranks // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_TempRankData implements _TempRankData {
  const _$_TempRankData({final List<int> ranks = const []}) : _ranks = ranks;

  final List<int> _ranks;
  @override
  @JsonKey()
  List<int> get ranks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ranks);
  }

  @override
  String toString() {
    return 'TempRankData(ranks: $ranks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempRankData &&
            const DeepCollectionEquality().equals(other._ranks, _ranks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ranks));

  @JsonKey(ignore: true)
  @override
  _$$_TempRankDataCopyWith<_$_TempRankData> get copyWith =>
      __$$_TempRankDataCopyWithImpl<_$_TempRankData>(this, _$identity);
}

abstract class _TempRankData implements TempRankData {
  const factory _TempRankData({final List<int> ranks}) = _$_TempRankData;

  @override
  List<int> get ranks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TempRankDataCopyWith<_$_TempRankData> get copyWith =>
      throw _privateConstructorUsedError;
}
