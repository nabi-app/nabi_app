// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_transmission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpTransmissionModelImpl _$$SignUpTransmissionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SignUpTransmissionModelImpl(
      email: json['email'] as String,
      loginType: $enumDecode(_$LoginTypeEnumMap, json['loginType']),
    );

Map<String, dynamic> _$$SignUpTransmissionModelImplToJson(
        _$SignUpTransmissionModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'loginType': _$LoginTypeEnumMap[instance.loginType]!,
    };

const _$LoginTypeEnumMap = {
  LoginType.kakao: 'kakao',
  LoginType.apple: 'apple',
};
