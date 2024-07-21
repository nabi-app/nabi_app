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

DiaryItemData _$DiaryItemDataFromJson(Map<String, dynamic> json) {
  return _DiaryItemData.fromJson(json);
}

/// @nodoc
mixin _$DiaryItemData {
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  int get diaryId => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<String>? get records => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "desc")
  String get description => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryItemDataCopyWith<DiaryItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryItemDataCopyWith<$Res> {
  factory $DiaryItemDataCopyWith(
          DiaryItemData value, $Res Function(DiaryItemData) then) =
      _$DiaryItemDataCopyWithImpl<$Res, DiaryItemData>;
  @useResult
  $Res call(
      {DateTime createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      int diaryId,
      List<String>? images,
      List<String>? tags,
      List<String>? records,
      DateTime date,
      @JsonKey(name: "desc") String description,
      int userId});
}

/// @nodoc
class _$DiaryItemDataCopyWithImpl<$Res, $Val extends DiaryItemData>
    implements $DiaryItemDataCopyWith<$Res> {
  _$DiaryItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? diaryId = null,
    Object? images = freezed,
    Object? tags = freezed,
    Object? records = freezed,
    Object? date = null,
    Object? description = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diaryId: null == diaryId
          ? _value.diaryId
          : diaryId // ignore: cast_nullable_to_non_nullable
              as int,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      records: freezed == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryItemDataImplCopyWith<$Res>
    implements $DiaryItemDataCopyWith<$Res> {
  factory _$$DiaryItemDataImplCopyWith(
          _$DiaryItemDataImpl value, $Res Function(_$DiaryItemDataImpl) then) =
      __$$DiaryItemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      int diaryId,
      List<String>? images,
      List<String>? tags,
      List<String>? records,
      DateTime date,
      @JsonKey(name: "desc") String description,
      int userId});
}

/// @nodoc
class __$$DiaryItemDataImplCopyWithImpl<$Res>
    extends _$DiaryItemDataCopyWithImpl<$Res, _$DiaryItemDataImpl>
    implements _$$DiaryItemDataImplCopyWith<$Res> {
  __$$DiaryItemDataImplCopyWithImpl(
      _$DiaryItemDataImpl _value, $Res Function(_$DiaryItemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? diaryId = null,
    Object? images = freezed,
    Object? tags = freezed,
    Object? records = freezed,
    Object? date = null,
    Object? description = null,
    Object? userId = null,
  }) {
    return _then(_$DiaryItemDataImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diaryId: null == diaryId
          ? _value.diaryId
          : diaryId // ignore: cast_nullable_to_non_nullable
              as int,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      records: freezed == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryItemDataImpl implements _DiaryItemData {
  _$DiaryItemDataImpl(
      {required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.diaryId,
      final List<String>? images,
      final List<String>? tags,
      final List<String>? records,
      required this.date,
      @JsonKey(name: "desc") required this.description,
      required this.userId})
      : _images = images,
        _tags = tags,
        _records = records;

  factory _$DiaryItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryItemDataImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;
  @override
  final int diaryId;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _records;
  @override
  List<String>? get records {
    final value = _records;
    if (value == null) return null;
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime date;
  @override
  @JsonKey(name: "desc")
  final String description;
  @override
  final int userId;

  @override
  String toString() {
    return 'DiaryItemData(createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, diaryId: $diaryId, images: $images, tags: $tags, records: $records, date: $date, description: $description, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryItemDataImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.diaryId, diaryId) || other.diaryId == diaryId) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      deletedAt,
      diaryId,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_records),
      date,
      description,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryItemDataImplCopyWith<_$DiaryItemDataImpl> get copyWith =>
      __$$DiaryItemDataImplCopyWithImpl<_$DiaryItemDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryItemDataImplToJson(
      this,
    );
  }
}

abstract class _DiaryItemData implements DiaryItemData {
  factory _DiaryItemData(
      {required final DateTime createdAt,
      required final DateTime? updatedAt,
      required final DateTime? deletedAt,
      required final int diaryId,
      final List<String>? images,
      final List<String>? tags,
      final List<String>? records,
      required final DateTime date,
      @JsonKey(name: "desc") required final String description,
      required final int userId}) = _$DiaryItemDataImpl;

  factory _DiaryItemData.fromJson(Map<String, dynamic> json) =
      _$DiaryItemDataImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  int get diaryId;
  @override
  List<String>? get images;
  @override
  List<String>? get tags;
  @override
  List<String>? get records;
  @override
  DateTime get date;
  @override
  @JsonKey(name: "desc")
  String get description;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$DiaryItemDataImplCopyWith<_$DiaryItemDataImpl> get copyWith =>
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
