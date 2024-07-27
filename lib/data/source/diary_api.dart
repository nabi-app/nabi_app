import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nabi_app/domain/model/diary_list_request.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';
import 'package:nabi_app/domain/model/diary_write_response.dart';
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

  @POST("/diary/write")
  Future<DiaryWriteResponse> writeDiary({
    @Part() required String date,
    @Part(name: "desc") required String content,
    @Part(name: "tags") required List<String> hashTags,
    @Part(name: "image_files") required List<File> images,
    @Part(name: "record_file") File? recordFile,
  });

  @DELETE("/diary/{id}")
  Future<void> deleteDiary({
    @Path("id") required int diaryId,
  });
}
