// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryListResponseImpl _$$DiaryListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DiaryListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => DiaryItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: DiaryListMetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DiaryListResponseImplToJson(
        _$DiaryListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$DiaryItemDataImpl _$$DiaryItemDataImplFromJson(Map<String, dynamic> json) =>
    _$DiaryItemDataImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      diaryId: (json['diaryId'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      records:
          (json['records'] as List<dynamic>?)?.map((e) => e as String).toList(),
      date: DateTime.parse(json['date'] as String),
      description: json['desc'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$$DiaryItemDataImplToJson(_$DiaryItemDataImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'diaryId': instance.diaryId,
      'images': instance.images,
      'tags': instance.tags,
      'records': instance.records,
      'date': instance.date.toIso8601String(),
      'desc': instance.description,
      'userId': instance.userId,
    };

_$DiaryListMetaDataImpl _$$DiaryListMetaDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DiaryListMetaDataImpl(
      order: json['order'] as String,
      page: (json['page'] as num).toInt(),
      take: (json['take'] as num).toInt(),
      filterMonth: (json['filter_month'] as num?)?.toInt(),
      filterTags: json['filter_tags'] as bool,
      filterImages: json['filter_images'] as bool,
      filterRecords: json['filter_records'] as bool,
      pageCount: (json['pageCount'] as num).toInt(),
      hasPreviousPage: json['hasPreviousPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$$DiaryListMetaDataImplToJson(
        _$DiaryListMetaDataImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'page': instance.page,
      'take': instance.take,
      'filter_month': instance.filterMonth,
      'filter_tags': instance.filterTags,
      'filter_images': instance.filterImages,
      'filter_records': instance.filterRecords,
      'pageCount': instance.pageCount,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
    };
