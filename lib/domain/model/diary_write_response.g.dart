// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_write_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryWriteResponseImpl _$$DiaryWriteResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DiaryWriteResponseImpl(
      imagesSuccess: json['imagesSuccess'] as bool,
      recordsSuccess: json['recordsSuccess'] as bool,
      data: DiaryItemData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DiaryWriteResponseImplToJson(
        _$DiaryWriteResponseImpl instance) =>
    <String, dynamic>{
      'imagesSuccess': instance.imagesSuccess,
      'recordsSuccess': instance.recordsSuccess,
      'data': instance.data,
    };
