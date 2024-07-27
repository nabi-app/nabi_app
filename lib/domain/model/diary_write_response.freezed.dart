// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_write_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiaryWriteResponse _$DiaryWriteResponseFromJson(Map<String, dynamic> json) {
  return _DiaryWriteResponse.fromJson(json);
}

/// @nodoc
mixin _$DiaryWriteResponse {
  bool get imagesSuccess => throw _privateConstructorUsedError;
  bool get recordsSuccess => throw _privateConstructorUsedError;
  DiaryItemData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryWriteResponseCopyWith<DiaryWriteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryWriteResponseCopyWith<$Res> {
  factory $DiaryWriteResponseCopyWith(
          DiaryWriteResponse value, $Res Function(DiaryWriteResponse) then) =
      _$DiaryWriteResponseCopyWithImpl<$Res, DiaryWriteResponse>;
  @useResult
  $Res call({bool imagesSuccess, bool recordsSuccess, DiaryItemData data});

  $DiaryItemDataCopyWith<$Res> get data;
}

/// @nodoc
class _$DiaryWriteResponseCopyWithImpl<$Res, $Val extends DiaryWriteResponse>
    implements $DiaryWriteResponseCopyWith<$Res> {
  _$DiaryWriteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesSuccess = null,
    Object? recordsSuccess = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      imagesSuccess: null == imagesSuccess
          ? _value.imagesSuccess
          : imagesSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      recordsSuccess: null == recordsSuccess
          ? _value.recordsSuccess
          : recordsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DiaryItemData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiaryItemDataCopyWith<$Res> get data {
    return $DiaryItemDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiaryWriteResponseImplCopyWith<$Res>
    implements $DiaryWriteResponseCopyWith<$Res> {
  factory _$$DiaryWriteResponseImplCopyWith(_$DiaryWriteResponseImpl value,
          $Res Function(_$DiaryWriteResponseImpl) then) =
      __$$DiaryWriteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool imagesSuccess, bool recordsSuccess, DiaryItemData data});

  @override
  $DiaryItemDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DiaryWriteResponseImplCopyWithImpl<$Res>
    extends _$DiaryWriteResponseCopyWithImpl<$Res, _$DiaryWriteResponseImpl>
    implements _$$DiaryWriteResponseImplCopyWith<$Res> {
  __$$DiaryWriteResponseImplCopyWithImpl(_$DiaryWriteResponseImpl _value,
      $Res Function(_$DiaryWriteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesSuccess = null,
    Object? recordsSuccess = null,
    Object? data = null,
  }) {
    return _then(_$DiaryWriteResponseImpl(
      imagesSuccess: null == imagesSuccess
          ? _value.imagesSuccess
          : imagesSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      recordsSuccess: null == recordsSuccess
          ? _value.recordsSuccess
          : recordsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DiaryItemData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryWriteResponseImpl implements _DiaryWriteResponse {
  _$DiaryWriteResponseImpl(
      {required this.imagesSuccess,
      required this.recordsSuccess,
      required this.data});

  factory _$DiaryWriteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryWriteResponseImplFromJson(json);

  @override
  final bool imagesSuccess;
  @override
  final bool recordsSuccess;
  @override
  final DiaryItemData data;

  @override
  String toString() {
    return 'DiaryWriteResponse(imagesSuccess: $imagesSuccess, recordsSuccess: $recordsSuccess, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryWriteResponseImpl &&
            (identical(other.imagesSuccess, imagesSuccess) ||
                other.imagesSuccess == imagesSuccess) &&
            (identical(other.recordsSuccess, recordsSuccess) ||
                other.recordsSuccess == recordsSuccess) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imagesSuccess, recordsSuccess, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryWriteResponseImplCopyWith<_$DiaryWriteResponseImpl> get copyWith =>
      __$$DiaryWriteResponseImplCopyWithImpl<_$DiaryWriteResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryWriteResponseImplToJson(
      this,
    );
  }
}

abstract class _DiaryWriteResponse implements DiaryWriteResponse {
  factory _DiaryWriteResponse(
      {required final bool imagesSuccess,
      required final bool recordsSuccess,
      required final DiaryItemData data}) = _$DiaryWriteResponseImpl;

  factory _DiaryWriteResponse.fromJson(Map<String, dynamic> json) =
      _$DiaryWriteResponseImpl.fromJson;

  @override
  bool get imagesSuccess;
  @override
  bool get recordsSuccess;
  @override
  DiaryItemData get data;
  @override
  @JsonKey(ignore: true)
  _$$DiaryWriteResponseImplCopyWith<_$DiaryWriteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
