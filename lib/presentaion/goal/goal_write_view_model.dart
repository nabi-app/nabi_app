import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/domain/model/todo_item_model.dart';

@injectable
class GoalWriteViewModel extends ChangeNotifier {
  String _title = "";

  String get title => _title;

  String _description = "";

  String get description => _description;

  DateTime? _goalDay;

  DateTime? get goalDay => _goalDay;

  DateTime? _notificationTime;

  DateTime? get notificationTime => _notificationTime;

  List<TodoItemModel> _todoList = [];

  List<TodoItemModel> get todoList => _todoList;

  void onTitleChanged(String value) {
    _title = value;
    notifyListeners();
  }

  void onDescriptionChanged(String value) {
    _description = value;
    notifyListeners();
  }

  void onGoalDayChanged(DateTime? date) {
    if (date == null) return;

    _goalDay = date;
    notifyListeners();
  }

  void clearGoalDay() {
    _goalDay = null;
    notifyListeners();
  }

  void addTodoList(String? content) {
    if (content == null) return;

    _todoList = [
      ..._todoList,
      TodoItemModel(content: content),
    ];
    notifyListeners();
  }

  void checkTodo(int index) {
    final oldTodo = _todoList[index];
    final newTodo = oldTodo.copyWith(complete: !oldTodo.complete);

    _todoList = [
      ..._todoList.sublist(0, index),
      newTodo,
      ...todoList.sublist(index + 1),
    ];

    notifyListeners();
  }

  void updateTodo({required int index, required String? content,}) {
    if (content == null) return;

    final oldTodo = _todoList[index];
    final newTodo = oldTodo.copyWith(content: content);

    _todoList = [
      ..._todoList.sublist(0, index),
      newTodo,
      ...todoList.sublist(index + 1),
    ];

    notifyListeners();
  }
}
