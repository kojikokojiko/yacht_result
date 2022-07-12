// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_rank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TempRankData _$$_TempRankDataFromJson(Map<String, dynamic> json) =>
    _$_TempRankData(
      ranks: (json['ranks'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [2],
      raceNum: json['raceNum'] as int? ?? 0,
      raceName: json['raceName'] as String? ?? "",
    );

Map<String, dynamic> _$$_TempRankDataToJson(_$_TempRankData instance) =>
    <String, dynamic>{
      'ranks': instance.ranks,
      'raceNum': instance.raceNum,
      'raceName': instance.raceName,
    };
