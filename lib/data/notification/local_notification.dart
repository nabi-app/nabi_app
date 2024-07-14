import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void initializeNotification() {
  const androidSettings = AndroidInitializationSettings("@mipmap/ic_launcher");
  const iosSettings = DarwinInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: false,
    requestAlertPermission: true,
  );

  const settings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  getIt<FlutterLocalNotificationsPlugin>().initialize(settings);
}

Future<void> scheduleNotification(DateTime date) async {
  tz.initializeTimeZones();

  final offSet = DateTime.now().timeZoneOffset;
  final localDate = date.add(-offSet);

  final scheduledDate = tz.TZDateTime(
    tz.local,
    localDate.year,
    localDate.month,
    localDate.day,
    localDate.hour,
    localDate.minute,
  );

  const details = NotificationDetails(
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: false,
    ),
    android: AndroidNotificationDetails(
      "goal_schedule_notification",
      "목표 스케쥴 알림",
      importance: Importance.max,
      priority: Priority.high,
    ),
  );

  await getIt<FlutterLocalNotificationsPlugin>().zonedSchedule(
    (DateTime.now().millisecondsSinceEpoch ~/ 1000).floor(),
    "title",
    "body",
    scheduledDate,
    details,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: null,
  );
}
