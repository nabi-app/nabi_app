// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(name: "records", fromJson: _processRecordUrl)
  String? get record => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "desc")
  String get content => throw _privateConstructorUsedError;
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
      @JsonKey(name: "records", fromJson: _processRecordUrl) String? record,
      DateTime date,
      @JsonKey(name: "desc") String content,
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
    Object? record = freezed,
    Object? date = null,
    Object? content = null,
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
      record: freezed == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: "records", fromJson: _processRecordUrl) String? record,
      DateTime date,
      @JsonKey(name: "desc") String content,
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
    Object? record = freezed,
    Object? date = null,
    Object? content = null,
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
      record: freezed == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
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
      this.updatedAt,
      this.deletedAt,
      required this.diaryId,
      final List<String>? images,
      final List<String>? tags,
      @JsonKey(name: "records", fromJson: _processRecordUrl) this.record,
      required this.date,
      @JsonKey(name: "desc") required this.content,
      required this.userId})
      : _images = images,
        _tags = tags;

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

  @override
  @JsonKey(name: "records", fromJson: _processRecordUrl)
  final String? record;
  @override
  final DateTime date;
  @override
  @JsonKey(name: "desc")
  final String content;
  @override
  final int userId;

  @override
  String toString() {
    return 'DiaryItemData(createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, diaryId: $diaryId, images: $images, tags: $tags, record: $record, date: $date, content: $content, userId: $userId)';
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
            (identical(other.record, record) || other.record == record) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.content, content) || other.content == content) &&
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
      record,
      date,
      content,
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
      final DateTime? updatedAt,
      final DateTime? deletedAt,
      required final int diaryId,
      final List<String>? images,
      final List<String>? tags,
      @JsonKey(name: "records", fromJson: _processRecordUrl)
      final String? record,
      required final DateTime date,
      @JsonKey(name: "desc") required final String content,
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
  @JsonKey(name: "records", fromJson: _processRecordUrl)
  String? get record;
  @override
  DateTime get date;
  @override
  @JsonKey(name: "desc")
  String get content;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$DiaryItemDataImplCopyWith<_$DiaryItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
