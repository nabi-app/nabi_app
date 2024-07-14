import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/model/login_response_model.dart';
import 'package:nabi_app/domain/model/nickname_duplicate_check_request.dart';
import 'package:nabi_app/domain/model/sign_up_response_model.dart';
import 'package:nabi_app/domain/model/token_refresh_response.dart';
import 'package:nabi_app/domain/model/user_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user_auth_api.g.dart';

@RestApi()
abstract class UserAuthApi {
  factory UserAuthApi(Dio dio, {required String baseUrl}) = _UserAuthApi;

  @POST("/auth/app-login")
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);

  @POST("/auth/logout")
  Future<void> logout();
  
  @POST("/user/name-check")
  Future<String> checkNicknameDuplicated(@Body() NicknameDuplicateCheckRequest body);

  @POST("/auth/create-account")
  @MultiPart()
  Future<SignUpResponseModel> signUp({
    @Part() required String email,
    @Part() required String provider,
    @Part() required String nickname,
    @Part() required bool marketingConsent,
    @Part() File? file,
  });
  
  @POST("/auth/refresh")
  Future<TokenRefreshResponse> refreshToken();

  @GET("/user/authenticate")
  Future<UserModel> getUserInfo();
  
  @DELETE("/user/delete")
  Future<void> withdraw();
}
