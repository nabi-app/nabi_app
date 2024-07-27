import 'dart:io';

import 'package:nabi_app/domain/model/diary_list_request.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';
import 'package:nabi_app/domain/model/diary_write_response.dart';

abstract interface class DiaryRepository {
  Future<DiaryListResponse> retrieveDiaryList({required DiaryListRequest queries});

  Future<DiaryWriteResponse> writeDiary({
    required DateTime date,
    required String content,
    required List<String> hashTags,
    required List<File> images,
    required File? recordFile,
  });

  Future<void> deleteDiary({required int diaryId});
}
