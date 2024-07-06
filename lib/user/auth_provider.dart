import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/model/user_model.dart';
import 'package:nabi_app/utils/constants.dart';

@singleton
class AuthProvider extends ChangeNotifier {
  UserModel? _userInfo;

  UserModel? get userInfo => _userInfo;

  void updateUserInfo(UserModel? value) {
    _userInfo = value;
    notifyListeners();
  }

  Future<void> logout() async {
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
      return path == "/" || path == "/login" || path == "/sign-up" ? null : "/login";
    }

    return path == "/" || path == "/login" ? "/home" : null;
  }
}
