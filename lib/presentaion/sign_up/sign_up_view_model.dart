import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nabi_app/utils/components/toast_widget.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class SignUpViewModel extends ChangeNotifier {
  final List _terms = [];

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

  void onTermSelected() {
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
    _tryNicknameDuplicationCheck = true;
    _passNicknameDuplicationCheck = true;
    notifyListeners();
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
      showToast(message: "이미지를 불러오는데 실패하였습니다.");
    }
  }
}
