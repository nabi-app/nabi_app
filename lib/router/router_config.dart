import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart';
import 'package:nabi_app/presentaion/login/login_view.dart';
import 'package:nabi_app/presentaion/login/login_view_model.dart';
import 'package:nabi_app/presentaion/diary/diary_page.dart';
import 'package:nabi_app/presentaion/home/home_page.dart';
import 'package:nabi_app/presentaion/main/main_view.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_complete_view.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_view.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_view_model.dart';
import 'package:nabi_app/presentaion/splash/splash_view.dart';
import 'package:nabi_app/presentaion/splash/splash_view_model.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

BuildContext? get rootContext => rootNavigatorKey.currentContext;

final GoRouter routerConfig = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: SplashView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<SplashViewModel>(),
        builder: (_, __) => const SplashView(),
      ),
    ),
    GoRoute(
      path: "/login",
      name: LoginView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<LoginViewModel>(),
        builder: (_, __) => const LoginView(),
      ),
    ),
    GoRoute(
      path: "/sign-up",
      name: SignUpView.name,
      builder: (_, state) => ChangeNotifierProvider(
        create: (_) => getIt<SignUpViewModel>(param1: state.extra as SignUpTransmissionModel),
        builder: (_, __) => const SignUpView(),
      ),
    ),
    GoRoute(
      path: "/sign-up-complete",
      name: SignUpCompleteView.name,
      builder: (_, __) => const SignUpCompleteView(),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/home",
              name: HomePage.name,
              pageBuilder: (_, __) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/diary",
              name: DiaryPage.name,
              pageBuilder: (_, __) => const NoTransitionPage(
                child: DiaryPage(),
              ),
            ),
          ],
        ),
      ],
      builder: (_, __, navigationShell) => MainView(
        navigationShell: navigationShell,
      ),
    ),
  ],
  refreshListenable: getIt<AuthProvider>(),
  redirect: getIt<AuthProvider>().redirection,
);
