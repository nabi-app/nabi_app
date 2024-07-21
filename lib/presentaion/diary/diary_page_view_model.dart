import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/domain/model/diary_list_request.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';
import 'package:nabi_app/domain/repository/diary_repository.dart';
import 'package:nabi_app/enum/diary_type.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';

@injectable
class DiaryPageViewModel extends ChangeNotifier {
  final DiaryRepository _repository;

  DiaryPageViewModel(this._repository) {
    _fetch();
  }

  DiaryListOrderType _orderType = DiaryListOrderType.asc;

  DiaryListOrderType get orderType => _orderType;

  List<DiaryItemData>? _items;

  List<DiaryItemData>? get items => _items;

  Future<void> _fetch() async {
    try {
      final response = await _repository.retrieveDiaryList(
        queries: DiaryListRequest(
          order: _orderType.name.toUpperCase(),
          page: 1,
        ),
      );

      _items = response.data;
      notifyListeners();
    } catch (e) {
      print(e);
      showToast(message: "잠시 후 다시 시도해주세요.");
    }
  }
}
