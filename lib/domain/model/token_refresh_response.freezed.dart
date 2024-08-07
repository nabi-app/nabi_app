// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_refresh_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenRefreshResponse _$TokenRefreshResponseFromJson(Map<String, dynamic> json) {
  return _TokenRefreshResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenRefreshResponse {
  @JsonKey(name: "access_token")
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenRefreshResponseCopyWith<TokenRefreshResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRefreshResponseCopyWith<$Res> {
  factory $TokenRefreshResponseCopyWith(TokenRefreshResponse value,
          $Res Function(TokenRefreshResponse) then) =
      _$TokenRefreshResponseCopyWithImpl<$Res, TokenRefreshResponse>;
  @useResult
  $Res call({@JsonKey(name: "access_token") String accessToken});
}

/// @nodoc
class _$TokenRefreshResponseCopyWithImpl<$Res,
        $Val extends TokenRefreshResponse>
    implements $TokenRefreshResponseCopyWith<$Res> {
  _$TokenRefreshResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenRefreshResponseImplCopyWith<$Res>
    implements $TokenRefreshResponseCopyWith<$Res> {
  factory _$$TokenRefreshResponseImplCopyWith(_$TokenRefreshResponseImpl value,
          $Res Function(_$TokenRefreshResponseImpl) then) =
      __$$TokenRefreshResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "access_token") String accessToken});
}

/// @nodoc
class __$$TokenRefreshResponseImplCopyWithImpl<$Res>
    extends _$TokenRefreshResponseCopyWithImpl<$Res, _$TokenRefreshResponseImpl>
    implements _$$TokenRefreshResponseImplCopyWith<$Res> {
  __$$TokenRefreshResponseImplCopyWithImpl(_$TokenRefreshResponseImpl _value,
      $Res Function(_$TokenRefreshResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_$TokenRefreshResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenRefreshResponseImpl implements _TokenRefreshResponse {
  const _$TokenRefreshResponseImpl(
      {@JsonKey(name: "access_token") required this.accessToken});

  factory _$TokenRefreshResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenRefreshResponseImplFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String accessToken;

  @override
  String toString() {
    return 'TokenRefreshResponse(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenRefreshResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenRefreshResponseImplCopyWith<_$TokenRefreshResponseImpl>
      get copyWith =>
          __$$TokenRefreshResponseImplCopyWithImpl<_$TokenRefreshResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenRefreshResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenRefreshResponse implements TokenRefreshResponse {
  const factory _TokenRefreshResponse(
          {@JsonKey(name: "access_token") required final String accessToken}) =
      _$TokenRefreshResponseImpl;

  factory _TokenRefreshResponse.fromJson(Map<String, dynamic> json) =
      _$TokenRefreshResponseImpl.fromJson;

  @override
  @JsonKey(name: "access_token")
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$TokenRefreshResponseImplCopyWith<_$TokenRefreshResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
