import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:nabi_app/domain/model/login_request_model.dart';
import 'package:nabi_app/domain/model/login_response_model.dart';
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';
import 'package:nabi_app/enum/login_type.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_view.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/constants.dart';
import 'package:nabi_app/utils/ui/components/custom_toast.dart';
import 'package:provider/provider.dart';
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

      final loginResponse = await _nabiLogin(
        LoginRequestModel(
          accessToken: token.accessToken,
          provider: LoginType.kakao.name,
        ),
      );

      if (loginResponse == null) return;

      if (loginResponse.isCreated) {
        _loginProcess(loginResponse);
        return;
      }

      final kakaoUserData = await _kakaoGetMe();

      if (kakaoUserData == null) return;

      _goSignUp(
        SignUpTransmissionModel(
          email: kakaoUserData.kakaoAccount?.email ?? "",
          loginType: LoginType.kakao,
        ),
      );
    } catch (e) {
      if (e is PlatformException && e.code == 'CANCELED') return;

      _loginWithKakaoAccount();
    }
  }

  Future<void> _loginWithKakaoAccount() async {
    try {
      final token = await UserApi.instance.loginWithKakaoAccount();

      final loginResponse = await _nabiLogin(
        LoginRequestModel(
          accessToken: token.accessToken,
          provider: LoginType.kakao.name,
        ),
      );

      if (loginResponse == null) return;

      if (loginResponse.isCreated) {
        _loginProcess(loginResponse);
        return;
      }

      final kakaoUserData = await _kakaoGetMe();

      if (kakaoUserData == null) return;

      _goSignUp(
        SignUpTransmissionModel(
          email: kakaoUserData.kakaoAccount?.email ?? "",
          loginType: LoginType.kakao,
        ),
      );
    } catch (e) {
      if (e is PlatformException && e.code == 'CANCELED') return;

      showToast(message: "카카오 로그인에 실패했습니다.");
    }
  }

  Future<User?> _kakaoGetMe() async {
    try {
      final response = UserApi.instance.me();

      return response;
    } catch (_) {
      showToast(message: "카카오 회원 정보를 가져오는데 실패했습니다.");
      return null;
    }
  }

  Future<void> appleLogin() async {
    try {
      final credentials = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: dotenv.get(appleIdentifierKey),
          redirectUri: Uri.parse(dotenv.get(signInWithAppleRedirectUrlKey)),
        ),
      );

      final loginResponse = await _nabiLogin(
        LoginRequestModel(
          accessToken: credentials.authorizationCode,
          provider: LoginType.apple.name,
        ),
      );

      if (loginResponse == null) return;

      if (loginResponse.isCreated) {
        _loginProcess(loginResponse);
        return;
      }

      final email = _getAppleEmail(credentials);

      if (email == null) return;

      _goSignUp(
        SignUpTransmissionModel(
          email: email,
          loginType: LoginType.apple,
        ),
      );
    } catch (e) {
      if (e is SignInWithAppleAuthorizationException && e.code == AuthorizationErrorCode.canceled) {
        return;
      }

      showToast(message: "애플 로그인에 실패했습니다.");
    }
  }

  String? _getAppleEmail(AuthorizationCredentialAppleID credentials) {
    final email = credentials.email;

    if (email != null) return email;

    final identityToken = credentials.identityToken;

    if (identityToken == null) {
      showToast(message: "애플 회원정보를 가져오는데 실패했습니다.");
      return null;
    }

    final jwt = identityToken.split(".");
    final payload = base64.normalize(jwt[1]);
    final json = base64.decode(payload);
    final userInfo = jsonDecode(utf8.decode(json));

    return userInfo["email"];
  }

  Future<LoginResponseModel?> _nabiLogin(LoginRequestModel requestModel) async {
    try {
      final response = await _repository.login(requestModel);

      return response;
    } catch (e) {
      showToast(message: "나비 앱 로그인 요청에 실패했습니다.");
      return null;
    }
  }

  Future<void> _loginProcess(LoginResponseModel loginData) async {
    try {
      final authProvider = rootContext?.read<AuthProvider>();

      await authProvider?.updateToken(
        accessToken: loginData.accessToken!,
        refreshToken: loginData.refreshToken!,
      );

      authProvider?.updateUserInfo(loginData.user);
    } catch (e) {
      showToast(message: "나비 앱 로그인이 실패했습니다.");
    }
  }

  void _goSignUp(SignUpTransmissionModel signUpData) => rootContext?.pushNamed(SignUpView.name, extra: signUpData);
}
