// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      content: json['desc'] as String,
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
      'desc': instance.content,
      'userId': instance.userId,
    };
