import 'package:injectable/injectable.dart';
import 'package:nabi_app/data/source/diary_api.dart';
import 'package:nabi_app/domain/model/diary_list_request.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';
import 'package:nabi_app/domain/repository/diary_repository.dart';

@LazySingleton(as: DiaryRepository)
class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryApi _api;

  const DiaryRepositoryImpl(this._api);

  @override
  Future<DiaryListResponse> retrieveDiaryList({required DiaryListRequest queries}) {
    return _api.retrieveDiaryList(queries: queries);
  }
}