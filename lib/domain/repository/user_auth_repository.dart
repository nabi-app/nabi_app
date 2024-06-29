import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/model/login_response_model.dart';

abstract interface class UserAuthRepository {
  Future<LoginResponseModel> login(LoginRequestModel body);
}