// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      userId: (json['userId'] as num).toInt(),
      email: json['email'] as String?,
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String?,
      marketingConsent: json['marketingConsent'] as bool,
      provider: $enumDecode(_$LoginTypeEnumMap, json['provider']),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'userId': instance.userId,
      'email': instance.email,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'marketingConsent': instance.marketingConsent,
      'provider': _$LoginTypeEnumMap[instance.provider]!,
    };

const _$LoginTypeEnumMap = {
  LoginType.kakao: 'kakao',
  LoginType.apple: 'apple',
};
