import 'package:injectable/injectable.dart';
import 'package:nabi_app/data/source/user_auth_api.dart';
import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/model/login_response_model.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';

@LazySingleton(as: UserAuthRepository)
class UserAuthRepositoryImpl implements UserAuthRepository {
  final UserAuthApi _api;

  const UserAuthRepositoryImpl(this._api);

  @override
  Future<LoginResponseModel> login(LoginRequestModel body) {
    return _api.login(body);
  }
}
