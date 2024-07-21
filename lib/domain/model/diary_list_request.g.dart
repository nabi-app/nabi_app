// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryListRequestImpl _$$DiaryListRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DiaryListRequestImpl(
      order: json['order'] as String,
      page: (json['page'] as num).toInt(),
      take: (json['take'] as num?)?.toInt() ?? 10,
      filterMonth: (json['filter_month'] as num?)?.toInt(),
      filterTag: json['filter_tag'] as bool? ?? false,
      filterImage: json['filter_image'] as bool? ?? false,
      filterRecords: json['filter_records'] as bool? ?? false,
    );

Map<String, dynamic> _$$DiaryListRequestImplToJson(
        _$DiaryListRequestImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'page': instance.page,
      'take': instance.take,
      'filter_month': instance.filterMonth,
      'filter_tag': instance.filterTag,
      'filter_image': instance.filterImage,
      'filter_records': instance.filterRecords,
    };
