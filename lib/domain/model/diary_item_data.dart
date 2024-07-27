import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_item_data.freezed.dart';
part 'diary_item_data.g.dart';

@freezed
@freezed
class DiaryItemData with _$DiaryItemData {
  factory DiaryItemData({
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    required int diaryId,
    List<String>? images,
    List<String>? tags,
    List<String>? records,
    required DateTime date,
    @JsonKey(name: "desc") required String content,
    required int userId,
  }) = _DiaryItemData;

  factory DiaryItemData.fromJson(Map<String, dynamic> json) => _$DiaryItemDataFromJson(json);
}