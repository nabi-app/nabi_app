import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/data/source/diary_api.dart';
import 'package:nabi_app/domain/model/diary_list_request.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';
import 'package:nabi_app/domain/model/diary_write_response.dart';
import 'package:nabi_app/domain/repository/diary_repository.dart';

@LazySingleton(as: DiaryRepository)
class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryApi _api;

  const DiaryRepositoryImpl(this._api);

  @override
  Future<DiaryListResponse> retrieveDiaryList({required DiaryListRequest queries}) {
    return _api.retrieveDiaryList(queries: queries);
  }

  @override
  Future<DiaryWriteResponse> writeDiary({
    required DateTime date,
    required String content,
    required List<String> hashTags,
    required List<File> images,
    required File? recordFile,
  }) {
    return _api.writeDiary(
      date: DateFormat("yyyy-MM-dd").format(date),
      content: content,
      hashTags: hashTags,
      images: images,
      recordFile: recordFile,
    );
  }

  @override
  Future<DiaryWriteResponse> updateDiary({
    required int diaryId,
    required DateTime date,
    required String content,
    required List<String> hashTags,
    required List<String> oldImages,
    required String? oldRecord,
    required List<File> newImages,
    required File? newRecord,
  }) {
    return _api.updateDiary(
      diaryId: diaryId,
      date: DateFormat("yyyy-MM-dd").format(date),
      content: content,
      hashTags: hashTags,
      oldImages: oldImages,
      oldRecord: [if (oldRecord != null) oldRecord],
      newImages: newImages,
      newRecord: [if (newRecord != null) newRecord],
    );
  }

  @override
  Future<void> deleteDiary({required int diaryId}) {
    return _api.deleteDiary(diaryId: diaryId);
  }
}
