import 'dart:io';

import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/model/login_response_model.dart';
import 'package:nabi_app/domain/model/nickname_duplicate_check_request.dart';
import 'package:nabi_app/domain/model/sign_up_response_model.dart';
import 'package:nabi_app/domain/model/token_refresh_response.dart';
import 'package:nabi_app/domain/model/user_model.dart';

abstract interface class UserAuthRepository {
  Future<LoginResponseModel> login(LoginRequestModel body);

  Future<void> logout();

  Future<bool> checkNicknameDuplicated(NicknameDuplicateCheckRequest body);

  Future<SignUpResponseModel> signUp({
    required String email,
    required String provider,
    required String nickname,
    required bool marketingConsent,
    File? file,
  });

  Future<TokenRefreshResponse> refreshToken();

  Future<UserModel> getUserInfo();

  Future<void> withdraw();
}
