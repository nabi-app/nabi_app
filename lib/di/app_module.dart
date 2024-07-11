import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  @lazySingleton
  FlutterLocalNotificationsPlugin get flutterLocalNotificationPlugin => FlutterLocalNotificationsPlugin();
}
