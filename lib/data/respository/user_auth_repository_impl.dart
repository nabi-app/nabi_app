import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:nabi_app/data/source/user_auth_api.dart';
import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/model/login_response_model.dart';
import 'package:nabi_app/domain/model/sign_up_response_model.dart';
import 'package:nabi_app/domain/model/token_refresh_response.dart';
import 'package:nabi_app/domain/model/user_model.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';

@LazySingleton(as: UserAuthRepository)
class UserAuthRepositoryImpl implements UserAuthRepository {
  final UserAuthApi _api;

  const UserAuthRepositoryImpl(this._api);

  @override
  Future<LoginResponseModel> login(LoginRequestModel body) {
    return _api.login(body);
  }

  @override
  Future<SignUpResponseModel> signUp({
    required String email,
    required String provider,
    required String nickname,
    required bool marketingConsent,
    File? file,
  }) {
    return _api.signUp(
      email: email,
      provider: provider,
      nickname: nickname,
      marketingConsent: marketingConsent,
      file: file,
    );
  }

  @override
  Future<TokenRefreshResponse> refreshToken() {
    return _api.refreshToken();
  }

  @override
  Future<UserModel> getUserInfo() {
    return _api.getUserInfo();
  }
}
