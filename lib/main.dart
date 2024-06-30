import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/ui/ui_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await dotenv.load(fileName: ".env");

  configureDependencies();

  KakaoSdk.init(
    nativeAppKey: dotenv.get("KAKAO_NATIVE_APP_KEY"),
    javaScriptAppKey: dotenv.get("KAKAO_JAVASCRIPT_APP_KEY"),
  );

  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: child!,
      );
    },
    child: MaterialApp.router(
      title: "나비 앱",
      theme: theme,
      darkTheme: dartTheme,
      builder: FToastBuilder(),
      routerConfig: routerConfig,
    ),
  ));
}
