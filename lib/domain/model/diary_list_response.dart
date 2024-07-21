import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_list_response.freezed.dart';
part 'diary_list_response.g.dart';

@freezed
class DiaryListResponse with _$DiaryListResponse {
  factory DiaryListResponse({
    required List<DiaryItemData> data,
    required DiaryListMetaData meta,
  }) = _DiaryListResponse;

  factory DiaryListResponse.fromJson(Map<String, dynamic> json) => _$DiaryListResponseFromJson(json);
}

@freezed
class DiaryItemData with _$DiaryItemData {
	factory DiaryItemData({
    required DateTime createdAt,
    required DateTime? updatedAt,
    required DateTime? deletedAt,
    required int diaryId,
    List<String>? images,
    List<String>? tags,
    List<String>? records,
    required DateTime date,
    @JsonKey(name: "desc") required String description,
    required int userId,
  }) = _DiaryItemData;

	factory DiaryItemData.fromJson(Map<String, dynamic> json) => _$DiaryItemDataFromJson(json);
}

@freezed
class DiaryListMetaData with _$DiaryListMetaData {
  factory DiaryListMetaData({
    required String order,
    required int page,
    required int take,
    @JsonKey(name: "filter_month") int? filterMonth,
    @JsonKey(name: "filter_tags") required bool filterTags,
    @JsonKey(name: "filter_images") required bool filterImages,
    @JsonKey(name: "filter_records") required bool filterRecords,
    required int pageCount,
    required bool hasPreviousPage,
    required bool hasNextPage,
  }) = _DiaryListMetaData;

  factory DiaryListMetaData.fromJson(Map<String, dynamic> json) => _$DiaryListMetaDataFromJson(json);
}
