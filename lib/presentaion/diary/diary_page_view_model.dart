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
    fetch();
  }

  DiaryListOrderType _orderType = DiaryListOrderType.asc;

  DiaryListOrderType get orderType => _orderType;

  bool _isTagFilterSelected = false;

  bool get isTagFilterSelected => _isTagFilterSelected;

  bool _isImageFilterSelected = false;

  bool get isImageFilterSelected => _isImageFilterSelected;

  bool _isRecordFilterSelected = false;

  bool get isRecordFilterSelected => _isRecordFilterSelected;

  int? _filterMonth;

  int? get filterMonth => _filterMonth;

  List<DiaryItemData>? _items;

  List<DiaryItemData>? get items => _items;

  int _pageKey = 1;

  bool _hasMore = true;

  Future<void> fetch() async {
    try {
      if (!_hasMore) return;

      final response = await _repository.retrieveDiaryList(
        queries: DiaryListRequest(
          order: _orderType.name.toUpperCase(),
          filterTags: _isTagFilterSelected,
          filterImages: _isImageFilterSelected,
          filterRecords: _isRecordFilterSelected,
          filterMonth: _filterMonth,
          page: _pageKey,
        ),
      );

      _items = [
        ...?_items,
        ...response.data,
      ];

      _hasMore = response.meta.hasNextPage;

      if (_hasMore) _pageKey += 1;

      notifyListeners();
    } catch (e) {
      showToast(message: "잠시 후 다시 시도해주세요.");
    }
  }

  Future<void> _refresh() async {
    _items = null;
    _pageKey = 1;
    _hasMore = true;
    fetch();
  }

  void onFilterChanged(
      ({
        bool isTagFilterSelected,
        bool isImageFilterSelected,
        bool isRecordFilterSelected,
        int? filterMonth,
        DiaryListOrderType orderType,
      })? filters) {
    if (filters == null) return;

    _isTagFilterSelected = filters.isTagFilterSelected;
    _isImageFilterSelected = filters.isImageFilterSelected;
    _isRecordFilterSelected = filters.isRecordFilterSelected;
    _filterMonth = filters.filterMonth;
    _orderType = filters.orderType;
    notifyListeners();

    _refresh();
  }

  void onOrderTypeChanged(DiaryListOrderType? orderType) {
    if (orderType == null) return;

    _orderType = orderType;
    notifyListeners();

    _refresh();
  }
}
