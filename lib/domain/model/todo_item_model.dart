import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_model.freezed.dart';
part 'todo_item_model.g.dart';

@freezed
class TodoItemModel with _$TodoItemModel {
  factory TodoItemModel({
    required String content,
    @Default(false) bool complete,
  }) = _TodoItemModel;

  factory TodoItemModel.fromJson(Map<String, dynamic> json) => _$TodoItemModelFromJson(json);
}