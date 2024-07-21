import 'package:nabi_app/domain/model/diary_list_request.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';

abstract interface class DiaryRepository {
  Future<DiaryListResponse> retrieveDiaryList({required DiaryListRequest queries});
}