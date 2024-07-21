import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPhotoPermission() async {
  if (Platform.isAndroid) {
    final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    final androidSdkVersion = androidDeviceInfo.version.sdkInt;
    final permission = androidSdkVersion < 33 ? Permission.storage : Permission.photos;
    final isGranted = await permission.isGranted;

    if (!isGranted) {
      final permissionStatus = await permission.request();

      if (!permissionStatus.isGranted) {
        showToast(message: "사진 접근 권한이 필요해요.");
        return false;
      }
    }
  }

  return true;
}

Future<void> requestNotificationPermission() async {
  const permission = Permission.notification;
  final isDenied = await permission.isDenied;
  final isPermanentlyDenied = await permission.isPermanentlyDenied;

  if (isDenied && !isPermanentlyDenied) {
    Permission.notification.request();
  }
}

Future<bool> requestMicPermission() async {
  const permission = Permission.microphone;
  final isGranted = await permission.isGranted;

  if (!isGranted) {
    final permissionStatus = await permission.request();

    if (!permissionStatus.isGranted) {
      showToast(message: "마이크 권한 설정이 필요해요.");
      return false;
    }
  }

  return true;
}