import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_list_request.freezed.dart';

part 'diary_list_request.g.dart';

@freezed
class DiaryListRequest with _$DiaryListRequest {
  factory DiaryListRequest({
    required String order,
    required int page,
    @Default(10) int take,
    @JsonKey(name: "filter_month") int? filterMonth,
    @Default(false) @JsonKey(name: "filter_tag") bool filterTag,
    @Default(false) @JsonKey(name: "filter_image") bool filterImage,
    @Default(false) @JsonKey(name: "filter_records") bool filterRecords,
  }) = _DiaryListRequest;

  factory DiaryListRequest.fromJson(Map<String, dynamic> json) => _$DiaryListRequestFromJson(json);
}
