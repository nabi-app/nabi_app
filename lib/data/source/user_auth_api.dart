import 'package:dio/dio.dart';
import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/model/login_response_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user_auth_api.g.dart';

@RestApi()
abstract class UserAuthApi {
  factory UserAuthApi(Dio dio, {required String baseUrl}) = _UserAuthApi;

  @POST("/auth/app-login")
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);
}
