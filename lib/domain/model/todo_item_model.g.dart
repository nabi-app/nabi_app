// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoItemModelImpl _$$TodoItemModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoItemModelImpl(
      content: json['content'] as String,
      complete: json['complete'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodoItemModelImplToJson(_$TodoItemModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'complete': instance.complete,
    };
