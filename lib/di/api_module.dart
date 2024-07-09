import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/data/source/user_auth_api.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/constants.dart';
import 'package:nabi_app/utils/ui/components/toast_widget.dart';
import 'package:nabi_app/utils/logger.dart';
import 'package:provider/provider.dart';

class BaseInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final isSignUpRequest = options.path == "/auth/create-account";

    if (!isSignUpRequest) {
      final accessToken = await getIt<FlutterSecureStorage>().read(key: accessTokenKey);

      options.headers.addAll({"Authorization": "Bearer $accessToken"});
    }

    logger.e("[Request Url] :::::: ${options.uri}");
    logger.e("[Request Header] :::::: ${options.headers}");
    logger.e("[Request Data] :::::: ${options.data}");
    logger.e("[Request QueryParameters] :::::: ${options.queryParameters}");

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e("[Error] StatusCode :::::: ${err.response?.statusCode} StatusMessage :::: ${err.response?.statusMessage}");
    logger.e("[Error Request] Request :::::: ${err.requestOptions.uri} Body ::::: ${err.requestOptions.data}");

    final isTokenExpired = err.response?.statusCode == 401;

    if (isTokenExpired) {
      if (err.requestOptions.path == "/auth/refresh") {
        rootContext!.read<AuthProvider>().logout();
        showToast(message: "다시 로그인 해주세요.");
        return handler.reject(err);
      }

      final tokenRefreshResponse = await getIt<UserAuthRepository>().refreshToken();
      final accessToken = tokenRefreshResponse.accessToken;

      await getIt<FlutterSecureStorage>().write(
        key: accessTokenKey,
        value: accessToken,
      );

      err.requestOptions.headers.addAll({"Authorization": "Bearer $accessToken"});

      final response = await getIt<Dio>().fetch(err.requestOptions);

      return handler.resolve(response);
    }

    return handler.reject(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d("[Response Url] :::::: ${response.requestOptions.uri}");
    logger.d("[Response Result] :::::: ${response.data}");

    super.onResponse(response, handler);
  }
}

@module
abstract class ApiModule {
  @lazySingleton
  Dio get dio => Dio()..interceptors.add(BaseInterceptor());

  @lazySingleton
  UserAuthApi userApi() => UserAuthApi(dio, baseUrl: dotenv.get(domainUrlKey));
}
