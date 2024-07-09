// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoItemModel _$TodoItemModelFromJson(Map<String, dynamic> json) {
  return _TodoItemModel.fromJson(json);
}

/// @nodoc
mixin _$TodoItemModel {
  String get content => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemModelCopyWith<TodoItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemModelCopyWith<$Res> {
  factory $TodoItemModelCopyWith(
          TodoItemModel value, $Res Function(TodoItemModel) then) =
      _$TodoItemModelCopyWithImpl<$Res, TodoItemModel>;
  @useResult
  $Res call({String content, bool complete});
}

/// @nodoc
class _$TodoItemModelCopyWithImpl<$Res, $Val extends TodoItemModel>
    implements $TodoItemModelCopyWith<$Res> {
  _$TodoItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? complete = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoItemModelImplCopyWith<$Res>
    implements $TodoItemModelCopyWith<$Res> {
  factory _$$TodoItemModelImplCopyWith(
          _$TodoItemModelImpl value, $Res Function(_$TodoItemModelImpl) then) =
      __$$TodoItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, bool complete});
}

/// @nodoc
class __$$TodoItemModelImplCopyWithImpl<$Res>
    extends _$TodoItemModelCopyWithImpl<$Res, _$TodoItemModelImpl>
    implements _$$TodoItemModelImplCopyWith<$Res> {
  __$$TodoItemModelImplCopyWithImpl(
      _$TodoItemModelImpl _value, $Res Function(_$TodoItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? complete = null,
  }) {
    return _then(_$TodoItemModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoItemModelImpl implements _TodoItemModel {
  _$TodoItemModelImpl({required this.content, this.complete = false});

  factory _$TodoItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoItemModelImplFromJson(json);

  @override
  final String content;
  @override
  @JsonKey()
  final bool complete;

  @override
  String toString() {
    return 'TodoItemModel(content: $content, complete: $complete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoItemModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.complete, complete) ||
                other.complete == complete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, complete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoItemModelImplCopyWith<_$TodoItemModelImpl> get copyWith =>
      __$$TodoItemModelImplCopyWithImpl<_$TodoItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoItemModelImplToJson(
      this,
    );
  }
}

abstract class _TodoItemModel implements TodoItemModel {
  factory _TodoItemModel({required final String content, final bool complete}) =
      _$TodoItemModelImpl;

  factory _TodoItemModel.fromJson(Map<String, dynamic> json) =
      _$TodoItemModelImpl.fromJson;

  @override
  String get content;
  @override
  bool get complete;
  @override
  @JsonKey(ignore: true)
  _$$TodoItemModelImplCopyWith<_$TodoItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
