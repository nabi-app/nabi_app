import 'dart:io';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/model/diary_item_data.dart';
import 'package:nabi_app/domain/repository/diary_repository.dart';
import 'package:nabi_app/enum/diary_type.dart';
import 'package:nabi_app/module/event_module.dart';
import 'package:nabi_app/utils/ui/components/custom_loading_bar.dart';
import 'package:nabi_app/utils/ui/components/custom_toast.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class DiaryWriteViewModel extends ChangeNotifier {
  final DiaryRepository _repository;
  DiaryItemData? _diaryItemData;

  DateTime _date = DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());

  DateTime get date => _date;

  List<String> _hashTags = [];

  List<String> get hashTags => _hashTags;

  File? _recordFile;

  File? get recordFile => _recordFile;

  List<File> _images = [];

  List<File> get images => _images;

  String _content = "";

  String get content => _content;

  DiaryWriteViewType _viewType = DiaryWriteViewType.create;

  DiaryWriteViewType get viewType => _viewType;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  DiaryWriteViewModel(this._repository, {@factoryParam DiaryItemData? data}) {
    _init(data);
  }

  Future _init(DiaryItemData? data) async {
    _diaryItemData = data;

    if (data == null) return;

    onViewTypeChanged(DiaryWriteViewType.readOnly);

    _isLoading = true;
    notifyListeners();

    _date = DateFormat("yyyy-MM-dd").parse(data.date.toString());
    _hashTags = data.tags ?? [];
    _images = await _parseImages(data.images) ?? [];
    _recordFile = null;
    _content = data.content;

    _isLoading = false;
    notifyListeners();
  }

  Future<List<File>?> _parseImages(List<String>? imagePathList) async {
    try {
      if (imagePathList?.isEmpty ?? true) return null;

      final dio = Dio(
        BaseOptions(responseType: ResponseType.bytes),
      );
      final dir = await getTemporaryDirectory();

      final result = await Future.wait<File>(
        [
          for (var index = 0; index < imagePathList!.length; index++)
            dio.get(imagePathList[index]).then(
                  (response) => File("${dir.path}/$index")..writeAsBytesSync(response.data),
                ),
        ],
      );

      return result;
    } catch (e) {
      showToast(message: "이미지를 불러오는데 실패했어요.");
      return null;
    }
  }

  void onViewTypeChanged(DiaryWriteViewType type) {
    _viewType = type;
    notifyListeners();
  }

  void onDateChanged(DateTime? date) {
    if (date == null) return;

    _date = date;
    notifyListeners();
  }

  void onHashTagsChanged(List<String>? hashTags) {
    if (hashTags == null) return;

    _hashTags = hashTags;
    notifyListeners();
  }

  void onRecordFileChanged(File? file) {
    if (file == null) return;

    _recordFile = file;
    notifyListeners();
  }

  void deleteRecordFile() {
    _recordFile = null;
    notifyListeners();
  }

  void addImage(XFile? image) {
    if (image == null) return;

    _images = [
      ..._images,
      File(image.path),
    ];
    notifyListeners();
  }

  void removeImage(int index) {
    _images = [
      ..._images.sublist(0, index),
      ..._images.sublist(index + 1),
    ];
    notifyListeners();
  }

  void onContentChanged(String value) {
    _content = value;
    notifyListeners();
  }

  Future<void> writeDiary() async {
    try {
      showLoadingBar();

      final response = await _repository.writeDiary(
        date: _date,
        content: _content,
        hashTags: _hashTags,
        images: images,
        recordFile: recordFile,
      );

      _diaryItemData = response.data;

      onViewTypeChanged(DiaryWriteViewType.readOnly);

      _fireDiaryListRefreshEvent();
    } catch (e) {
      showCommonErrorToast();
    } finally {
      dismissLoadingBar();
    }
  }

  Future<bool> deleteDiary() async {
    try {
      showLoadingBar();

      await _repository.deleteDiary(diaryId: _diaryItemData!.diaryId);

      _fireDiaryListRefreshEvent();

      return true;
    } catch (e) {
      showCommonErrorToast();
      return false;
    } finally {
      dismissLoadingBar();
    }
  }

  void _fireDiaryListRefreshEvent() => getIt<EventBus>().fire(getIt<DiaryListRefreshEvent>());
}
