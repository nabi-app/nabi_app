// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_list_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiaryListRequest _$DiaryListRequestFromJson(Map<String, dynamic> json) {
  return _DiaryListRequest.fromJson(json);
}

/// @nodoc
mixin _$DiaryListRequest {
  String get order => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get take => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_month")
  int? get filterMonth => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_tag")
  bool get filterTag => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_image")
  bool get filterImage => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_records")
  bool get filterRecords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryListRequestCopyWith<DiaryListRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryListRequestCopyWith<$Res> {
  factory $DiaryListRequestCopyWith(
          DiaryListRequest value, $Res Function(DiaryListRequest) then) =
      _$DiaryListRequestCopyWithImpl<$Res, DiaryListRequest>;
  @useResult
  $Res call(
      {String order,
      int page,
      int take,
      @JsonKey(name: "filter_month") int? filterMonth,
      @JsonKey(name: "filter_tag") bool filterTag,
      @JsonKey(name: "filter_image") bool filterImage,
      @JsonKey(name: "filter_records") bool filterRecords});
}

/// @nodoc
class _$DiaryListRequestCopyWithImpl<$Res, $Val extends DiaryListRequest>
    implements $DiaryListRequestCopyWith<$Res> {
  _$DiaryListRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? page = null,
    Object? take = null,
    Object? filterMonth = freezed,
    Object? filterTag = null,
    Object? filterImage = null,
    Object? filterRecords = null,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      take: null == take
          ? _value.take
          : take // ignore: cast_nullable_to_non_nullable
              as int,
      filterMonth: freezed == filterMonth
          ? _value.filterMonth
          : filterMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      filterTag: null == filterTag
          ? _value.filterTag
          : filterTag // ignore: cast_nullable_to_non_nullable
              as bool,
      filterImage: null == filterImage
          ? _value.filterImage
          : filterImage // ignore: cast_nullable_to_non_nullable
              as bool,
      filterRecords: null == filterRecords
          ? _value.filterRecords
          : filterRecords // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryListRequestImplCopyWith<$Res>
    implements $DiaryListRequestCopyWith<$Res> {
  factory _$$DiaryListRequestImplCopyWith(_$DiaryListRequestImpl value,
          $Res Function(_$DiaryListRequestImpl) then) =
      __$$DiaryListRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String order,
      int page,
      int take,
      @JsonKey(name: "filter_month") int? filterMonth,
      @JsonKey(name: "filter_tag") bool filterTag,
      @JsonKey(name: "filter_image") bool filterImage,
      @JsonKey(name: "filter_records") bool filterRecords});
}

/// @nodoc
class __$$DiaryListRequestImplCopyWithImpl<$Res>
    extends _$DiaryListRequestCopyWithImpl<$Res, _$DiaryListRequestImpl>
    implements _$$DiaryListRequestImplCopyWith<$Res> {
  __$$DiaryListRequestImplCopyWithImpl(_$DiaryListRequestImpl _value,
      $Res Function(_$DiaryListRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? page = null,
    Object? take = null,
    Object? filterMonth = freezed,
    Object? filterTag = null,
    Object? filterImage = null,
    Object? filterRecords = null,
  }) {
    return _then(_$DiaryListRequestImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      take: null == take
          ? _value.take
          : take // ignore: cast_nullable_to_non_nullable
              as int,
      filterMonth: freezed == filterMonth
          ? _value.filterMonth
          : filterMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      filterTag: null == filterTag
          ? _value.filterTag
          : filterTag // ignore: cast_nullable_to_non_nullable
              as bool,
      filterImage: null == filterImage
          ? _value.filterImage
          : filterImage // ignore: cast_nullable_to_non_nullable
              as bool,
      filterRecords: null == filterRecords
          ? _value.filterRecords
          : filterRecords // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryListRequestImpl implements _DiaryListRequest {
  _$DiaryListRequestImpl(
      {required this.order,
      required this.page,
      this.take = 10,
      @JsonKey(name: "filter_month") this.filterMonth,
      @JsonKey(name: "filter_tag") this.filterTag = false,
      @JsonKey(name: "filter_image") this.filterImage = false,
      @JsonKey(name: "filter_records") this.filterRecords = false});

  factory _$DiaryListRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryListRequestImplFromJson(json);

  @override
  final String order;
  @override
  final int page;
  @override
  @JsonKey()
  final int take;
  @override
  @JsonKey(name: "filter_month")
  final int? filterMonth;
  @override
  @JsonKey(name: "filter_tag")
  final bool filterTag;
  @override
  @JsonKey(name: "filter_image")
  final bool filterImage;
  @override
  @JsonKey(name: "filter_records")
  final bool filterRecords;

  @override
  String toString() {
    return 'DiaryListRequest(order: $order, page: $page, take: $take, filterMonth: $filterMonth, filterTag: $filterTag, filterImage: $filterImage, filterRecords: $filterRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryListRequestImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.take, take) || other.take == take) &&
            (identical(other.filterMonth, filterMonth) ||
                other.filterMonth == filterMonth) &&
            (identical(other.filterTag, filterTag) ||
                other.filterTag == filterTag) &&
            (identical(other.filterImage, filterImage) ||
                other.filterImage == filterImage) &&
            (identical(other.filterRecords, filterRecords) ||
                other.filterRecords == filterRecords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, order, page, take, filterMonth,
      filterTag, filterImage, filterRecords);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryListRequestImplCopyWith<_$DiaryListRequestImpl> get copyWith =>
      __$$DiaryListRequestImplCopyWithImpl<_$DiaryListRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryListRequestImplToJson(
      this,
    );
  }
}

abstract class _DiaryListRequest implements DiaryListRequest {
  factory _DiaryListRequest(
          {required final String order,
          required final int page,
          final int take,
          @JsonKey(name: "filter_month") final int? filterMonth,
          @JsonKey(name: "filter_tag") final bool filterTag,
          @JsonKey(name: "filter_image") final bool filterImage,
          @JsonKey(name: "filter_records") final bool filterRecords}) =
      _$DiaryListRequestImpl;

  factory _DiaryListRequest.fromJson(Map<String, dynamic> json) =
      _$DiaryListRequestImpl.fromJson;

  @override
  String get order;
  @override
  int get page;
  @override
  int get take;
  @override
  @JsonKey(name: "filter_month")
  int? get filterMonth;
  @override
  @JsonKey(name: "filter_tag")
  bool get filterTag;
  @override
  @JsonKey(name: "filter_image")
  bool get filterImage;
  @override
  @JsonKey(name: "filter_records")
  bool get filterRecords;
  @override
  @JsonKey(ignore: true)
  _$$DiaryListRequestImplCopyWith<_$DiaryListRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
