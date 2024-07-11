import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/model/user_model.dart';
import 'package:nabi_app/presentaion/goal/goal_page.dart';
import 'package:nabi_app/presentaion/login/login_view.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_view.dart';
import 'package:nabi_app/presentaion/splash/splash_view.dart';
import 'package:nabi_app/utils/constants.dart';

@singleton
class AuthProvider extends ChangeNotifier {
  UserModel? _userInfo;

  UserModel? get userInfo => _userInfo;

  void updateUserInfo(UserModel? value) {
    _userInfo = value;
    notifyListeners();
  }

  Future<void> updateToken({required String accessToken, required String refreshToken}) async {
    final storage = getIt<FlutterSecureStorage>();

    await Future.wait(
      [
        storage.write(
          key: accessTokenKey,
          value: accessToken,
        ),
        storage.write(
          key: refreshTokenKey,
          value: refreshToken,
        ),
      ],
    );
  }

  Future<void> deleteToken() async {
    final storage = getIt<FlutterSecureStorage>();
    await Future.wait(
      [
        storage.delete(key: accessTokenKey),
        storage.delete(key: refreshTokenKey),
      ],
    );
    updateUserInfo(null);
  }

  String? redirection(BuildContext context, GoRouterState state) {
    final path = state.fullPath;

    if (_userInfo == null) {
      return path == SplashView.path || path == LoginView.path || path == SignUpView.path ? null : LoginView.path;
    }

    return path == SplashView.path || path == LoginView.path ? GoalPage.path : null;
  }
}
