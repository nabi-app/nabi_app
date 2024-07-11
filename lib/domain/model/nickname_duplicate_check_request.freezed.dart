// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nickname_duplicate_check_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NicknameDuplicateCheckRequest _$NicknameDuplicateCheckRequestFromJson(
    Map<String, dynamic> json) {
  return _NicknameDuplicateCheckRequest.fromJson(json);
}

/// @nodoc
mixin _$NicknameDuplicateCheckRequest {
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NicknameDuplicateCheckRequestCopyWith<NicknameDuplicateCheckRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NicknameDuplicateCheckRequestCopyWith<$Res> {
  factory $NicknameDuplicateCheckRequestCopyWith(
          NicknameDuplicateCheckRequest value,
          $Res Function(NicknameDuplicateCheckRequest) then) =
      _$NicknameDuplicateCheckRequestCopyWithImpl<$Res,
          NicknameDuplicateCheckRequest>;
  @useResult
  $Res call({String nickname});
}

/// @nodoc
class _$NicknameDuplicateCheckRequestCopyWithImpl<$Res,
        $Val extends NicknameDuplicateCheckRequest>
    implements $NicknameDuplicateCheckRequestCopyWith<$Res> {
  _$NicknameDuplicateCheckRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NicknameDuplicateCheckRequestImplCopyWith<$Res>
    implements $NicknameDuplicateCheckRequestCopyWith<$Res> {
  factory _$$NicknameDuplicateCheckRequestImplCopyWith(
          _$NicknameDuplicateCheckRequestImpl value,
          $Res Function(_$NicknameDuplicateCheckRequestImpl) then) =
      __$$NicknameDuplicateCheckRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname});
}

/// @nodoc
class __$$NicknameDuplicateCheckRequestImplCopyWithImpl<$Res>
    extends _$NicknameDuplicateCheckRequestCopyWithImpl<$Res,
        _$NicknameDuplicateCheckRequestImpl>
    implements _$$NicknameDuplicateCheckRequestImplCopyWith<$Res> {
  __$$NicknameDuplicateCheckRequestImplCopyWithImpl(
      _$NicknameDuplicateCheckRequestImpl _value,
      $Res Function(_$NicknameDuplicateCheckRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
  }) {
    return _then(_$NicknameDuplicateCheckRequestImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NicknameDuplicateCheckRequestImpl
    implements _NicknameDuplicateCheckRequest {
  _$NicknameDuplicateCheckRequestImpl({required this.nickname});

  factory _$NicknameDuplicateCheckRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NicknameDuplicateCheckRequestImplFromJson(json);

  @override
  final String nickname;

  @override
  String toString() {
    return 'NicknameDuplicateCheckRequest(nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameDuplicateCheckRequestImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NicknameDuplicateCheckRequestImplCopyWith<
          _$NicknameDuplicateCheckRequestImpl>
      get copyWith => __$$NicknameDuplicateCheckRequestImplCopyWithImpl<
          _$NicknameDuplicateCheckRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NicknameDuplicateCheckRequestImplToJson(
      this,
    );
  }
}

abstract class _NicknameDuplicateCheckRequest
    implements NicknameDuplicateCheckRequest {
  factory _NicknameDuplicateCheckRequest({required final String nickname}) =
      _$NicknameDuplicateCheckRequestImpl;

  factory _NicknameDuplicateCheckRequest.fromJson(Map<String, dynamic> json) =
      _$NicknameDuplicateCheckRequestImpl.fromJson;

  @override
  String get nickname;
  @override
  @JsonKey(ignore: true)
  _$$NicknameDuplicateCheckRequestImplCopyWith<
          _$NicknameDuplicateCheckRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
