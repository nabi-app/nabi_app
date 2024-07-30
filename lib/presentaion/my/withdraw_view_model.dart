import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';
import 'package:nabi_app/enum/login_type.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/ui/components/custom_loading_bar.dart';
import 'package:nabi_app/utils/ui/components/custom_toast.dart';
import 'package:provider/provider.dart';

@injectable
class WithdrawViewModel extends ChangeNotifier {
  final UserAuthRepository _authRepository;

  WithdrawViewModel(this._authRepository);


  Future<void> withdraw() async {
    try {
      showLoadingBar();

      final authProvider = rootContext!.read<AuthProvider>();

      await Future.wait(
        [
          if (authProvider.userInfo!.provider == LoginType.kakao) UserApi.instance.logout(),
          _authRepository.withdraw(),
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