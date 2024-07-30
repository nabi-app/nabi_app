import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';
import 'package:nabi_app/enum/login_type.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/ui/components/custom_loading_bar.dart';
import 'package:nabi_app/utils/ui/components/custom_toast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@injectable
class MyViewModel extends ChangeNotifier {
  final UserAuthRepository _authRepository;

  MyViewModel(this._authRepository) {
    _getVersion();
  }

  String? _version;

  String? get version => _version;

  Future<void> _getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    _version = packageInfo.version;
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      showLoadingBar();

      final authProvider = rootContext!.read<AuthProvider>();

      await Future.wait(
        [
          if (authProvider.userInfo!.provider == LoginType.kakao) UserApi.instance.logout(),
          _authRepository.logout(),
        ],
      );

      authProvider.deleteToken();
    } catch (_) {
      showCommonErrorToast();
    } finally {
      dismissLoadingBar();
    }
  }
}
