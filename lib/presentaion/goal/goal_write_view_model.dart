import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/domain/model/todo_item_model.dart';
import 'package:nabi_app/enum/notification_time_type.dart';
import 'package:nabi_app/presentaion/goal/components/goal_write_components.dart';

@injectable
class GoalWriteViewModel extends ChangeNotifier {
  String _title = "";

  String get title => _title;

  String _description = "";

  String get description => _description;

  DateTime? _goalDay;

  DateTime? get goalDay => _goalDay;

  NotificationTime? _notificationTime;

  NotificationTime? get notificationTime => _notificationTime;

  String get notificationTimeText {
    final minute = _notificationTime!.minute;

    return "${calculateHour().toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
  }

  int calculateHour() {
    final hour = _notificationTime!.hour;

    if (_notificationTime!.type == NotificationTimeType.morning) {
      return hour != 12 ? hour : 0;
    }

    return hour != 12 ? hour + 12 : hour;
  }

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

  void onNotificationTimeChanged(NotificationTime? value) {
    if (value == null) return;

    _notificationTime = value;
    notifyListeners();
  }

  void clearNotificationTime() {
    _notificationTime = null;
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

  void updateTodo({
    required int index,
    required String? content,
  }) {
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
