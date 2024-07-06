// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_transmission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpTransmissionModel _$SignUpTransmissionModelFromJson(
    Map<String, dynamic> json) {
  return _SignUpTransmissionModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpTransmissionModel {
  String get email => throw _privateConstructorUsedError;
  LoginType get loginType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpTransmissionModelCopyWith<SignUpTransmissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpTransmissionModelCopyWith<$Res> {
  factory $SignUpTransmissionModelCopyWith(SignUpTransmissionModel value,
          $Res Function(SignUpTransmissionModel) then) =
      _$SignUpTransmissionModelCopyWithImpl<$Res, SignUpTransmissionModel>;
  @useResult
  $Res call({String email, LoginType loginType});
}

/// @nodoc
class _$SignUpTransmissionModelCopyWithImpl<$Res,
        $Val extends SignUpTransmissionModel>
    implements $SignUpTransmissionModelCopyWith<$Res> {
  _$SignUpTransmissionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? loginType = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as LoginType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpTransmissionModelImplCopyWith<$Res>
    implements $SignUpTransmissionModelCopyWith<$Res> {
  factory _$$SignUpTransmissionModelImplCopyWith(
          _$SignUpTransmissionModelImpl value,
          $Res Function(_$SignUpTransmissionModelImpl) then) =
      __$$SignUpTransmissionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, LoginType loginType});
}

/// @nodoc
class __$$SignUpTransmissionModelImplCopyWithImpl<$Res>
    extends _$SignUpTransmissionModelCopyWithImpl<$Res,
        _$SignUpTransmissionModelImpl>
    implements _$$SignUpTransmissionModelImplCopyWith<$Res> {
  __$$SignUpTransmissionModelImplCopyWithImpl(
      _$SignUpTransmissionModelImpl _value,
      $Res Function(_$SignUpTransmissionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? loginType = null,
  }) {
    return _then(_$SignUpTransmissionModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as LoginType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpTransmissionModelImpl implements _SignUpTransmissionModel {
  _$SignUpTransmissionModelImpl({required this.email, required this.loginType});

  factory _$SignUpTransmissionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpTransmissionModelImplFromJson(json);

  @override
  final String email;
  @override
  final LoginType loginType;

  @override
  String toString() {
    return 'SignUpTransmissionModel(email: $email, loginType: $loginType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpTransmissionModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.loginType, loginType) ||
                other.loginType == loginType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, loginType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpTransmissionModelImplCopyWith<_$SignUpTransmissionModelImpl>
      get copyWith => __$$SignUpTransmissionModelImplCopyWithImpl<
          _$SignUpTransmissionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpTransmissionModelImplToJson(
      this,
    );
  }
}

abstract class _SignUpTransmissionModel implements SignUpTransmissionModel {
  factory _SignUpTransmissionModel(
      {required final String email,
      required final LoginType loginType}) = _$SignUpTransmissionModelImpl;

  factory _SignUpTransmissionModel.fromJson(Map<String, dynamic> json) =
      _$SignUpTransmissionModelImpl.fromJson;

  @override
  String get email;
  @override
  LoginType get loginType;
  @override
  @JsonKey(ignore: true)
  _$$SignUpTransmissionModelImplCopyWith<_$SignUpTransmissionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
