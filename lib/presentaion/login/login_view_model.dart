import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';
import 'package:nabi_app/enum/login_type.dart';
import 'package:nabi_app/presentaion/main/home/home_tab.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_view.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/components/toast_widget.dart';
import 'package:nabi_app/utils/constants.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@injectable
class LoginViewModel extends ChangeNotifier {
  final UserAuthRepository _repository;

  LoginViewModel(this._repository);

  Future<void> kakaoLogin() async {
    final kakaoTalkInstalled = await isKakaoTalkInstalled();

    if (kakaoTalkInstalled) {
      _loginWithKakaoTalk();
      return;
    }

    _loginWithKakaoAccount();
  }

  Future<void> _loginWithKakaoTalk() async {
    try {
      final token = await UserApi.instance.loginWithKakaoTalk();

      _requestLogin(
        accessToken: token.accessToken,
        loginType: LoginType.kakao,
      );
    } catch (e) {
      if (e is PlatformException && e.code == 'CANCELED') return;

      _loginWithKakaoAccount();
    }
  }

  Future<void> _loginWithKakaoAccount() async {
    try {
      final token = await UserApi.instance.loginWithKakaoAccount();

      _requestLogin(
        accessToken: token.accessToken,
        loginType: LoginType.kakao,
      );
    } catch (e) {
      if (e is PlatformException && e.code == 'CANCELED') return;

      showToast(message: "카카오 로그인에 실패하였습니다.");
    }
  }

  Future<void> appleLogin() async {
    try {
      final credentials = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email],
      );

      _requestLogin(
        accessToken: credentials.authorizationCode,
        loginType: LoginType.apple,
      );
    } catch (e) {
      if (e is SignInWithAppleAuthorizationException && e.code == AuthorizationErrorCode.canceled) {
        return;
      }

      showToast(message: "애플 로그인에 실패하였습니다.");
    }
  }

  Future<void> _requestLogin({
    required String accessToken,
    required LoginType loginType,
  }) async {
    try {
      final response = await _repository.login(
        LoginRequestModel(
          accessToken: accessToken,
          provider: loginType.name,
        ),
      );

      if (response.isCreated) {
        final storage = getIt<FlutterSecureStorage>();

        await Future.wait([
          storage.write(
            key: accessTokenKey,
            value: response.user!.accessToken,
          ),
          storage.write(
            key: refreshTokenKey,
            value: response.user!.refreshToken,
          ),
        ]);

        rootNavigatorKey.currentContext?.goNamed(HomeTab.name);
        return;
      }

      rootNavigatorKey.currentContext?.pushNamed(SignUpView.name);
    } catch (e) {
      showToast(message: "나비 앱 로그인 요청에 실패하였습니다.");
    }
  }
}
