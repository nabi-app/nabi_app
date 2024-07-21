import 'package:dio/dio.dart';
import 'package:nabi_app/domain/model/diary_list_request.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'diary_api.g.dart';

@RestApi()
abstract class DiaryApi {
  factory DiaryApi(Dio dio, {required String baseUrl}) = _DiaryApi;

  @GET("/diary")
  Future<DiaryListResponse> retrieveDiaryList({
    @Queries() required DiaryListRequest queries,
  });
}
