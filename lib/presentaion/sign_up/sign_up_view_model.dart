import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/domain/model/nickname_duplicate_check_request.dart';
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart';
import 'package:nabi_app/domain/repository/user_auth_repository.dart';
import 'package:nabi_app/enum/sign_up_term_type.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_complete_view.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/components/toast_widget.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

@injectable
class SignUpViewModel extends ChangeNotifier {
  final UserAuthRepository _repository;
  final SignUpTransmissionModel _signUpTransmissionModel;

  SignUpViewModel(
    this._repository,
    @factoryParam this._signUpTransmissionModel,
  );

  final Set<SignUpTermType> _terms = {};

  Set<SignUpTermType> get terms => _terms;

  bool get agreedNecessaryTerms => _terms.containsAll({
        SignUpTermType.olderAge14,
        SignUpTermType.serviceUsage,
        SignUpTermType.privacy,
      });

  String _nickname = "";

  String get nickname => _nickname;

  bool _passNicknameValidationCheck = true;

  bool get passNicknameValidationCheck => _passNicknameValidationCheck;

  bool get satisfyNicknameCondition => _nickname.isNotEmpty && _passNicknameValidationCheck;

  bool _tryNicknameDuplicationCheck = false;

  bool get tryNicknameDuplicationCheck => _tryNicknameDuplicationCheck;

  bool _passNicknameDuplicationCheck = false;

  bool get passNicknameDuplicationCheck => _passNicknameDuplicationCheck;

  File? _profileImage;

  File? get profileImage => _profileImage;

  void onTermSelected(SignUpTermType term) {
    if (_terms.contains(term)) {
      _terms.remove(term);
    } else {
      _terms.add(term);
    }

    notifyListeners();
  }

  void onNicknameChanged(String value) {
    _tryNicknameDuplicationCheck = false;
    _passNicknameDuplicationCheck = false;

    _nickname = value;

    final regExp = RegExp(r'[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z\d]$');

    _passNicknameValidationCheck = !value.split("").any((char) => !regExp.hasMatch(char));

    notifyListeners();
  }

  Future<void> checkDuplication() async {
    try {
      _tryNicknameDuplicationCheck = true;

      final result = await _repository.checkNicknameDuplicated(
        NicknameDuplicateCheckRequest(nickname: _nickname),
      );

      _passNicknameDuplicationCheck = bool.parse(result);
      notifyListeners();
    } catch (e) {
      showToast(message: "잠시 후에 다시 시도해주세요.");
    }
  }

  Future<void> pickProfileImage() async {
    try {
      if (Platform.isAndroid) {
        final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
        final androidSdkVersion = androidDeviceInfo.version.sdkInt;
        final permission = androidSdkVersion < 33 ? Permission.storage : Permission.photos;
        final isGranted = await permission.isGranted;

        if (!isGranted) {
          final permissionStatus = await permission.request();

          if (!permissionStatus.isGranted) {
            // 토스트
          }
        }
      }

      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
      );

      if (image == null) return;

      _profileImage = File(image.path);
      notifyListeners();
    } catch (e) {
      showToast(message: "이미지를 불러오는데 실패했습니다.");
    }
  }

  Future<void> signUp() async {
    try {
      final response = await _repository.signUp(
        email: _signUpTransmissionModel.email,
        provider: _signUpTransmissionModel.loginType.name,
        nickname: nickname,
        marketingConsent: _terms.contains(SignUpTermType.marketing),
        file: _profileImage,
      );

      final authProvider = rootContext?.read<AuthProvider>();

      await authProvider?.updateToken(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      authProvider?.updateUserInfo(response.user);

      rootContext?.goNamed(SignUpCompleteView.name);
    } catch (e) {
      showToast(message: "회원가입에 실패했습니다.");
    }
  }
}
