import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart';
import 'package:nabi_app/presentaion/goal/goal_write_view.dart';
import 'package:nabi_app/presentaion/goal/goal_write_view_model.dart';
import 'package:nabi_app/presentaion/goal/goal_page.dart';
import 'package:nabi_app/presentaion/goal/nabi_custom_view.dart';
import 'package:nabi_app/presentaion/goal/nabi_custom_view_model.dart';
import 'package:nabi_app/presentaion/login/login_view.dart';
import 'package:nabi_app/presentaion/login/login_view_model.dart';
import 'package:nabi_app/presentaion/diary/diary_page.dart';
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
  initialLocation: SplashView.path,
  routes: [
    GoRoute(
      path: SplashView.path,
      name: SplashView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<SplashViewModel>(),
        builder: (_, __) => const SplashView(),
      ),
    ),
    GoRoute(
      path: LoginView.path,
      name: LoginView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<LoginViewModel>(),
        builder: (_, __) => const LoginView(),
      ),
    ),
    GoRoute(
      path: SignUpView.path,
      name: SignUpView.name,
      builder: (_, state) => ChangeNotifierProvider(
        create: (_) => getIt<SignUpViewModel>(param1: state.extra as SignUpTransmissionModel),
        builder: (_, __) => const SignUpView(),
      ),
    ),
    GoRoute(
      path: SignUpCompleteView.path,
      name: SignUpCompleteView.name,
      builder: (_, __) => const SignUpCompleteView(),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: GoalPage.path,
              name: GoalPage.name,
              pageBuilder: (_, __) => const NoTransitionPage(
                child: GoalPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: DiaryPage.path,
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
    GoRoute(
      path: GoalWriteView.path,
      name: GoalWriteView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<GoalWriteViewModel>(),
        builder: (_, __) => const GoalWriteView(),
      ),
    ),
    GoRoute(
      path: NabiCustomView.path,
      name: NabiCustomView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<NabiCustomViewModel>(),
        builder: (_, __) => const NabiCustomView(),
      ),
    ),
  ],
  refreshListenable: getIt<AuthProvider>(),
  redirect: getIt<AuthProvider>().redirection,
);
