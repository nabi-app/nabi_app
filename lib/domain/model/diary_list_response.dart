import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nabi_app/domain/model/diary_item_data.dart';

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
