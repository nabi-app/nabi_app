// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiaryListResponse _$DiaryListResponseFromJson(Map<String, dynamic> json) {
  return _DiaryListResponse.fromJson(json);
}

/// @nodoc
mixin _$DiaryListResponse {
  List<DiaryItemData> get data => throw _privateConstructorUsedError;
  DiaryListMetaData get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryListResponseCopyWith<DiaryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryListResponseCopyWith<$Res> {
  factory $DiaryListResponseCopyWith(
          DiaryListResponse value, $Res Function(DiaryListResponse) then) =
      _$DiaryListResponseCopyWithImpl<$Res, DiaryListResponse>;
  @useResult
  $Res call({List<DiaryItemData> data, DiaryListMetaData meta});

  $DiaryListMetaDataCopyWith<$Res> get meta;
}

/// @nodoc
class _$DiaryListResponseCopyWithImpl<$Res, $Val extends DiaryListResponse>
    implements $DiaryListResponseCopyWith<$Res> {
  _$DiaryListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiaryItemData>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DiaryListMetaData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiaryListMetaDataCopyWith<$Res> get meta {
    return $DiaryListMetaDataCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiaryListResponseImplCopyWith<$Res>
    implements $DiaryListResponseCopyWith<$Res> {
  factory _$$DiaryListResponseImplCopyWith(_$DiaryListResponseImpl value,
          $Res Function(_$DiaryListResponseImpl) then) =
      __$$DiaryListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DiaryItemData> data, DiaryListMetaData meta});

  @override
  $DiaryListMetaDataCopyWith<$Res> get meta;
}

/// @nodoc
class __$$DiaryListResponseImplCopyWithImpl<$Res>
    extends _$DiaryListResponseCopyWithImpl<$Res, _$DiaryListResponseImpl>
    implements _$$DiaryListResponseImplCopyWith<$Res> {
  __$$DiaryListResponseImplCopyWithImpl(_$DiaryListResponseImpl _value,
      $Res Function(_$DiaryListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$DiaryListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiaryItemData>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DiaryListMetaData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryListResponseImpl implements _DiaryListResponse {
  _$DiaryListResponseImpl(
      {required final List<DiaryItemData> data, required this.meta})
      : _data = data;

  factory _$DiaryListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryListResponseImplFromJson(json);

  final List<DiaryItemData> _data;
  @override
  List<DiaryItemData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final DiaryListMetaData meta;

  @override
  String toString() {
    return 'DiaryListResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryListResponseImplCopyWith<_$DiaryListResponseImpl> get copyWith =>
      __$$DiaryListResponseImplCopyWithImpl<_$DiaryListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryListResponseImplToJson(
      this,
    );
  }
}

abstract class _DiaryListResponse implements DiaryListResponse {
  factory _DiaryListResponse(
      {required final List<DiaryItemData> data,
      required final DiaryListMetaData meta}) = _$DiaryListResponseImpl;

  factory _DiaryListResponse.fromJson(Map<String, dynamic> json) =
      _$DiaryListResponseImpl.fromJson;

  @override
  List<DiaryItemData> get data;
  @override
  DiaryListMetaData get meta;
  @override
  @JsonKey(ignore: true)
  _$$DiaryListResponseImplCopyWith<_$DiaryListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiaryListMetaData _$DiaryListMetaDataFromJson(Map<String, dynamic> json) {
  return _DiaryListMetaData.fromJson(json);
}

/// @nodoc
mixin _$DiaryListMetaData {
  String get order => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get take => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_month")
  int? get filterMonth => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_tags")
  bool get filterTags => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_images")
  bool get filterImages => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_records")
  bool get filterRecords => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  bool get hasPreviousPage => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryListMetaDataCopyWith<DiaryListMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryListMetaDataCopyWith<$Res> {
  factory $DiaryListMetaDataCopyWith(
          DiaryListMetaData value, $Res Function(DiaryListMetaData) then) =
      _$DiaryListMetaDataCopyWithImpl<$Res, DiaryListMetaData>;
  @useResult
  $Res call(
      {String order,
      int page,
      int take,
      @JsonKey(name: "filter_month") int? filterMonth,
      @JsonKey(name: "filter_tags") bool filterTags,
      @JsonKey(name: "filter_images") bool filterImages,
      @JsonKey(name: "filter_records") bool filterRecords,
      int pageCount,
      bool hasPreviousPage,
      bool hasNextPage});
}

/// @nodoc
class _$DiaryListMetaDataCopyWithImpl<$Res, $Val extends DiaryListMetaData>
    implements $DiaryListMetaDataCopyWith<$Res> {
  _$DiaryListMetaDataCopyWithImpl(this._value, this._then);

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
    Object? filterTags = null,
    Object? filterImages = null,
    Object? filterRecords = null,
    Object? pageCount = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
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
      filterTags: null == filterTags
          ? _value.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as bool,
      filterImages: null == filterImages
          ? _value.filterImages
          : filterImages // ignore: cast_nullable_to_non_nullable
              as bool,
      filterRecords: null == filterRecords
          ? _value.filterRecords
          : filterRecords // ignore: cast_nullable_to_non_nullable
              as bool,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryListMetaDataImplCopyWith<$Res>
    implements $DiaryListMetaDataCopyWith<$Res> {
  factory _$$DiaryListMetaDataImplCopyWith(_$DiaryListMetaDataImpl value,
          $Res Function(_$DiaryListMetaDataImpl) then) =
      __$$DiaryListMetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String order,
      int page,
      int take,
      @JsonKey(name: "filter_month") int? filterMonth,
      @JsonKey(name: "filter_tags") bool filterTags,
      @JsonKey(name: "filter_images") bool filterImages,
      @JsonKey(name: "filter_records") bool filterRecords,
      int pageCount,
      bool hasPreviousPage,
      bool hasNextPage});
}

/// @nodoc
class __$$DiaryListMetaDataImplCopyWithImpl<$Res>
    extends _$DiaryListMetaDataCopyWithImpl<$Res, _$DiaryListMetaDataImpl>
    implements _$$DiaryListMetaDataImplCopyWith<$Res> {
  __$$DiaryListMetaDataImplCopyWithImpl(_$DiaryListMetaDataImpl _value,
      $Res Function(_$DiaryListMetaDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? page = null,
    Object? take = null,
    Object? filterMonth = freezed,
    Object? filterTags = null,
    Object? filterImages = null,
    Object? filterRecords = null,
    Object? pageCount = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
  }) {
    return _then(_$DiaryListMetaDataImpl(
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
      filterTags: null == filterTags
          ? _value.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as bool,
      filterImages: null == filterImages
          ? _value.filterImages
          : filterImages // ignore: cast_nullable_to_non_nullable
              as bool,
      filterRecords: null == filterRecords
          ? _value.filterRecords
          : filterRecords // ignore: cast_nullable_to_non_nullable
              as bool,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryListMetaDataImpl implements _DiaryListMetaData {
  _$DiaryListMetaDataImpl(
      {required this.order,
      required this.page,
      required this.take,
      @JsonKey(name: "filter_month") this.filterMonth,
      @JsonKey(name: "filter_tags") required this.filterTags,
      @JsonKey(name: "filter_images") required this.filterImages,
      @JsonKey(name: "filter_records") required this.filterRecords,
      required this.pageCount,
      required this.hasPreviousPage,
      required this.hasNextPage});

  factory _$DiaryListMetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryListMetaDataImplFromJson(json);

  @override
  final String order;
  @override
  final int page;
  @override
  final int take;
  @override
  @JsonKey(name: "filter_month")
  final int? filterMonth;
  @override
  @JsonKey(name: "filter_tags")
  final bool filterTags;
  @override
  @JsonKey(name: "filter_images")
  final bool filterImages;
  @override
  @JsonKey(name: "filter_records")
  final bool filterRecords;
  @override
  final int pageCount;
  @override
  final bool hasPreviousPage;
  @override
  final bool hasNextPage;

  @override
  String toString() {
    return 'DiaryListMetaData(order: $order, page: $page, take: $take, filterMonth: $filterMonth, filterTags: $filterTags, filterImages: $filterImages, filterRecords: $filterRecords, pageCount: $pageCount, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryListMetaDataImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.take, take) || other.take == take) &&
            (identical(other.filterMonth, filterMonth) ||
                other.filterMonth == filterMonth) &&
            (identical(other.filterTags, filterTags) ||
                other.filterTags == filterTags) &&
            (identical(other.filterImages, filterImages) ||
                other.filterImages == filterImages) &&
            (identical(other.filterRecords, filterRecords) ||
                other.filterRecords == filterRecords) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      order,
      page,
      take,
      filterMonth,
      filterTags,
      filterImages,
      filterRecords,
      pageCount,
      hasPreviousPage,
      hasNextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryListMetaDataImplCopyWith<_$DiaryListMetaDataImpl> get copyWith =>
      __$$DiaryListMetaDataImplCopyWithImpl<_$DiaryListMetaDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryListMetaDataImplToJson(
      this,
    );
  }
}

abstract class _DiaryListMetaData implements DiaryListMetaData {
  factory _DiaryListMetaData(
      {required final String order,
      required final int page,
      required final int take,
      @JsonKey(name: "filter_month") final int? filterMonth,
      @JsonKey(name: "filter_tags") required final bool filterTags,
      @JsonKey(name: "filter_images") required final bool filterImages,
      @JsonKey(name: "filter_records") required final bool filterRecords,
      required final int pageCount,
      required final bool hasPreviousPage,
      required final bool hasNextPage}) = _$DiaryListMetaDataImpl;

  factory _DiaryListMetaData.fromJson(Map<String, dynamic> json) =
      _$DiaryListMetaDataImpl.fromJson;

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
  @JsonKey(name: "filter_tags")
  bool get filterTags;
  @override
  @JsonKey(name: "filter_images")
  bool get filterImages;
  @override
  @JsonKey(name: "filter_records")
  bool get filterRecords;
  @override
  int get pageCount;
  @override
  bool get hasPreviousPage;
  @override
  bool get hasNextPage;
  @override
  @JsonKey(ignore: true)
  _$$DiaryListMetaDataImplCopyWith<_$DiaryListMetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
