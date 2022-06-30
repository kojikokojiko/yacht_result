import 'package:freezed_annotation/freezed_annotation.dart';
part 'temp_rank_model.freezed.dart';




@freezed
class TempRankData with _$TempRankData {
  const factory TempRankData({
    @Default([]) List<int> ranks,

  }) = _TempRankData;
}

// flutter pub run build_runner build --delete-conflicting-outputs
//