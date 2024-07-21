import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class DiaryWriteViewModel extends ChangeNotifier {
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
}