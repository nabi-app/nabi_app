import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/data/source/user_auth_api.dart';

@module
abstract class UserApiModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  UserAuthApi userApi() => UserAuthApi(dio, baseUrl: dotenv.get("DOMAIN_URL"));
}