import 'package:freezed_annotation/freezed_annotation.dart';
part 'temp_rank_model.freezed.dart';
part 'temp_rank_model.g.dart';




@freezed
class TempRankData with _$TempRankData {
  const factory TempRankData({
    @Default([2]) List<int> ranks,
    @Default(0) int raceNum,
    @Default("") String raceName,

  }) = _TempRankData;

  factory TempRankData.fromJson(Map<String, Object?> json)
  => _$TempRankDataFromJson(json);
}

// flutter pub run build_runner build --delete-conflicting-outputs
//