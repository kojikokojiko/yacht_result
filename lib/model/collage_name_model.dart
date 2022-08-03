import 'package:freezed_annotation/freezed_annotation.dart';

part 'collage_name_model.freezed.dart';
part 'collage_name_model.g.dart';


@freezed
class CollageNameData with _$CollageNameData {
  const factory CollageNameData({
    @Default("") String uid,
    @Default(1000) int yachtNum,
    @Default("") String collageName,

  }) = _CollageNameData;

  factory CollageNameData.fromJson(Map<String, Object?> json)
  => _$CollageNameDataFromJson(json);
}
