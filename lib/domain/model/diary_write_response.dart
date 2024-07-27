import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nabi_app/domain/model/diary_item_data.dart';

part 'diary_write_response.freezed.dart';

part 'diary_write_response.g.dart';

@freezed
class DiaryWriteResponse with _$DiaryWriteResponse {
  factory DiaryWriteResponse({
    required bool imagesSuccess,
    required bool recordsSuccess,
    required DiaryItemData data,
  }) = _DiaryWriteResponse;

  factory DiaryWriteResponse.fromJson(Map<String, dynamic> json) => _$DiaryWriteResponseFromJson(json);
}