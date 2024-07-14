import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/constants.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Future.wait(
    [
      initializeDateFormatting(),
      dotenv.load(fileName: ".env"),
    ],
  );

  configureDependencies();

  KakaoSdk.init(
    nativeAppKey: dotenv.get(kakaoNativeAppKey),
    javaScriptAppKey: dotenv.get(kakaoJavascriptAppKey),
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
            ],
            child: MaterialApp.router(
              title: "나비 앱",
              theme: theme,
              builder: FToastBuilder(),
              routerConfig: routerConfig,
            ),
          ),
        );
      },
    ),
  );
}
