import 'dart:io';
import 'package:collection/collection.dart';
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

  DiaryWriteViewType _viewType = DiaryWriteViewType.create;

  DiaryWriteViewType get viewType => _viewType;

  DateTime _date = DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());

  DateTime get date => _date;

  List<String> _hashTags = [];

  List<String> get hashTags => _hashTags;

  File? _recordFile;

  File? get recordFile => _recordFile;

  String? _updatedRecord;

  List<File> _images = [];

  List<File> get images => _images;

  final List<String> _updatedImages = [];

  String _content = "";

  String get content => _content;

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
    _recordFile = await _parseRecordFile(data.record);
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
          for (final path in imagePathList!)
            dio.get(path).then(
                  (response) => File("${dir.path}/${path.hashCode}")..writeAsBytesSync(response.data),
                ),
        ],
      );

      return result;
    } catch (_) {
      showToast(message: "이미지를 불러오는데 실패했어요.");
      return null;
    }
  }

  Future<File?> _parseRecordFile(String? recordPath) async {
    try {
      if (recordPath == null) return null;

      final dio = Dio(
        BaseOptions(responseType: ResponseType.bytes),
      );
      final dir = await getTemporaryDirectory();

      final response = await dio.get(recordPath);

      final file = File("${dir.path}/record.m4a");

      file.writeAsBytesSync(response.data);

      return file;
    } catch (_) {
      showToast(message: "녹음 파일을 불러오는데 실패했어요.");
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
    if (_viewType == DiaryWriteViewType.edit && _diaryItemData!.record != null) {
      _updatedRecord = _diaryItemData!.record;
    }

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
    if (_viewType == DiaryWriteViewType.edit && (_diaryItemData!.images?.isNotEmpty ?? false)) {
      final deleteImagePath = _diaryItemData!.images!.firstWhereOrNull(
        (path) => path.hashCode == _images[index].path.split('/').last.hashCode,
      );

      if (deleteImagePath != null) _updatedImages.add(deleteImagePath);
    }

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
    } catch (_) {
      showCommonErrorToast();
    } finally {
      dismissLoadingBar();
    }
  }

  Future<void> updateDiary() async {
    try {
      showLoadingBar();

      final response = await _repository.updateDiary(
        diaryId: _diaryItemData!.diaryId,
        date: date,
        content: content,
        hashTags: hashTags,
        updatedImages: _updatedImages,
        updatedRecord: _updatedRecord,
        images: images,
        recordFile: recordFile,
      );

      _diaryItemData = response.data;

      onViewTypeChanged(DiaryWriteViewType.readOnly);

      _fireDiaryListRefreshEvent();
    } catch (_) {
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
    } catch (_) {
      showCommonErrorToast();
      return false;
    } finally {
      dismissLoadingBar();
    }
  }

  void _fireDiaryListRefreshEvent() => getIt<EventBus>().fire(getIt<DiaryListRefreshEvent>());
}
