import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';
import 'package:nabi_app/presentaion/login/login_view.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/constants.dart';
import 'package:provider/provider.dart';

@injectable
class SplashViewModel extends ChangeNotifier {
  final UserAuthRepository _repository;

  SplashViewModel(this._repository);

  Future<void> autoLogin() async {
    try {
      final storage = getIt<FlutterSecureStorage>();
      final tokens = await Future.wait(
        [
          storage.read(key: accessTokenKey),
          storage.read(key: refreshTokenKey),
        ],
      );

      if (tokens[0] == null || tokens[1] == null) {
        rootContext?.goNamed(LoginView.name);
        return;
      }

      final userInfo = await _repository.getUserInfo();

      rootContext?.read<AuthProvider>().updateUserInfo(userInfo);
    } catch (e) {
      rootContext?.goNamed(LoginView.name);
    }
  }
}
