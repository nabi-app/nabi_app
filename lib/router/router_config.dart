import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/di/di_setup.dart';
import 'package:nabi_app/domain/model/diary_item_data.dart';
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart';
import 'package:nabi_app/presentaion/diary/diary_page_view_model.dart';
import 'package:nabi_app/presentaion/diary/diary_write_image_detail_view.dart';
import 'package:nabi_app/presentaion/diary/diary_write_view.dart';
import 'package:nabi_app/presentaion/diary/diary_write_view_model.dart';
import 'package:nabi_app/presentaion/goal/goal_write_view.dart';
import 'package:nabi_app/presentaion/goal/goal_write_view_model.dart';
import 'package:nabi_app/presentaion/goal/goal_page.dart';
import 'package:nabi_app/presentaion/goal/nabi_custom_view.dart';
import 'package:nabi_app/presentaion/goal/nabi_custom_view_model.dart';
import 'package:nabi_app/presentaion/login/login_view.dart';
import 'package:nabi_app/presentaion/login/login_view_model.dart';
import 'package:nabi_app/presentaion/diary/diary_page.dart';
import 'package:nabi_app/presentaion/main/main_view.dart';
import 'package:nabi_app/presentaion/music_recommend/music_recommend_detail_view.dart';
import 'package:nabi_app/presentaion/music_recommend/music_recommend_page.dart';
import 'package:nabi_app/presentaion/music_recommend/music_recommend_page_view_model.dart';
import 'package:nabi_app/presentaion/my/my_view.dart';
import 'package:nabi_app/presentaion/my/my_view_model.dart';
import 'package:nabi_app/presentaion/my/notice_detail_view.dart';
import 'package:nabi_app/presentaion/my/notice_view.dart';
import 'package:nabi_app/presentaion/my/notice_view_model.dart';
import 'package:nabi_app/presentaion/my/privacy_policy_view.dart';
import 'package:nabi_app/presentaion/my/usage_term_view.dart';
import 'package:nabi_app/presentaion/my/withdraw_view.dart';
import 'package:nabi_app/presentaion/my/withdraw_view_model.dart';
import 'package:nabi_app/presentaion/nabi_collection/nabi_collection_page.dart';
import 'package:nabi_app/presentaion/nabi_collection/nabi_collection_page_view_model.dart';
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
      builder: (_, __, navigationShell) => MainView(navigationShell: navigationShell),
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
              pageBuilder: (_, __) => NoTransitionPage(
                child: ChangeNotifierProvider(
                  create: (_) => getIt<DiaryPageViewModel>(),
                  builder: (_, __) => const DiaryPage(),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NabiCollectionPage.path,
              name: NabiCollectionPage.name,
              pageBuilder: (_, __) => NoTransitionPage(
                child: ChangeNotifierProvider(
                  create: (_) => getIt<NabiCollectionPageViewModel>(),
                  builder: (_, __) => const NabiCollectionPage(),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MusicRecommendPage.path,
              name: MusicRecommendPage.name,
              pageBuilder: (_, __) => NoTransitionPage(
                child: ChangeNotifierProvider(
                  create: (_) => getIt<MusicRecommendPageViewModel>(),
                  builder: (_, __) => const MusicRecommendPage(),
                ),
              ),
            ),
          ],
        ),
      ],
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
    GoRoute(
      path: DiaryWriteView.path,
      name: DiaryWriteView.name,
      builder: (_, state) => ChangeNotifierProvider(
        create: (_) => getIt<DiaryWriteViewModel>(param1: state.extra as DiaryItemData?),
        builder: (_, __) => const DiaryWriteView(),
      ),
      routes: [
        GoRoute(
          path: DiaryWriteImageDetailView.path,
          name: DiaryWriteImageDetailView.name,
          builder: (_, state) => DiaryWriteImageDetailView(args: state.extra as ({List<File> images, int index})),
        ),
      ],
    ),
    GoRoute(
      path: MusicRecommendDetailView.path,
      name: MusicRecommendDetailView.name,
      builder: (_, __) => MusicRecommendDetailView(),
    ),
    GoRoute(
      path: MyView.path,
      name: MyView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<MyViewModel>(),
        builder: (_, __) => const MyView(),
      ),
    ),
    GoRoute(
      path: UsageTermView.path,
      name: UsageTermView.name,
      builder: (_, __) => const UsageTermView(),
    ),
    GoRoute(
      path: PrivacyPolicyView.path,
      name: PrivacyPolicyView.name,
      builder: (_, __) => const PrivacyPolicyView(),
    ),
    GoRoute(
      path: WithdrawView.path,
      name: WithdrawView.name,
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<WithdrawViewModel>(),
        builder: (_, __) => const WithdrawView(),
      ),
    ),
    GoRoute(
        path: NoticeView.path,
        name: NoticeView.name,
        builder: (_, __) => ChangeNotifierProvider(
              create: (_) => getIt<NoticeViewModel>(),
              builder: (_, __) => const NoticeView(),
            ),
        routes: [
          GoRoute(
            path: NoticeDetailView.path,
            name: NoticeDetailView.name,
            builder: (_, __) => const NoticeDetailView(),
          ),
        ]),
  ],
  refreshListenable: getIt<AuthProvider>(),
  redirect: getIt<AuthProvider>().redirection,
);
