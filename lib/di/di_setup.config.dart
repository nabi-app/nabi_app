// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:event_bus/event_bus.dart' as _i9;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i15;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nabi_app/data/respository/diary_repository_impl.dart' as _i17;
import 'package:nabi_app/data/respository/user_auth_repository_impl.dart'
    as _i19;
import 'package:nabi_app/data/source/diary_api.dart' as _i13;
import 'package:nabi_app/data/source/user_auth_api.dart' as _i12;
import 'package:nabi_app/domain/model/diary_item_data.dart' as _i24;
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart' as _i21;
import 'package:nabi_app/domain/repository/diary_repository.dart' as _i16;
import 'package:nabi_app/domain/repository/user_auth_repository.dart' as _i18;
import 'package:nabi_app/module/api_module.dart' as _i29;
import 'package:nabi_app/module/app_module.dart' as _i30;
import 'package:nabi_app/module/event_module.dart' as _i10;
import 'package:nabi_app/presentaion/diary/diary_page_view_model.dart' as _i22;
import 'package:nabi_app/presentaion/diary/diary_write_view_model.dart' as _i23;
import 'package:nabi_app/presentaion/goal/goal_write_view_model.dart' as _i7;
import 'package:nabi_app/presentaion/goal/nabi_custom_view_model.dart' as _i6;
import 'package:nabi_app/presentaion/login/login_view_model.dart' as _i28;
import 'package:nabi_app/presentaion/music_recommend/music_recommend_page_view_model.dart'
    as _i3;
import 'package:nabi_app/presentaion/my/my_view_model.dart' as _i26;
import 'package:nabi_app/presentaion/my/notice_view_model.dart' as _i5;
import 'package:nabi_app/presentaion/my/withdraw_view_model.dart' as _i25;
import 'package:nabi_app/presentaion/nabi_collection/nabi_collection_page_view_model.dart'
    as _i4;
import 'package:nabi_app/presentaion/sign_up/sign_up_view_model.dart' as _i20;
import 'package:nabi_app/presentaion/splash/splash_view_model.dart' as _i27;
import 'package:nabi_app/user/auth_provider.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final eventModule = _$EventModule();
    final apiModule = _$ApiModule();
    final appModule = _$AppModule();
    gh.factory<_i3.MusicRecommendPageViewModel>(
        () => _i3.MusicRecommendPageViewModel());
    gh.factory<_i4.NabiCollectionPageViewModel>(
        () => _i4.NabiCollectionPageViewModel());
    gh.factory<_i5.NoticeViewModel>(() => _i5.NoticeViewModel());
    gh.factory<_i6.NabiCustomViewModel>(() => _i6.NabiCustomViewModel());
    gh.factory<_i7.GoalWriteViewModel>(() => _i7.GoalWriteViewModel());
    gh.singleton<_i8.AuthProvider>(() => _i8.AuthProvider());
    gh.lazySingleton<_i9.EventBus>(() => eventModule.eventBus);
    gh.lazySingleton<_i10.DiaryListRefreshEvent>(
        () => _i10.DiaryListRefreshEvent());
    gh.lazySingleton<_i11.Dio>(() => apiModule.dio);
    gh.lazySingleton<_i12.UserAuthApi>(() => apiModule.userApi());
    gh.lazySingleton<_i13.DiaryApi>(() => apiModule.diaryApi());
    gh.lazySingleton<_i14.FlutterSecureStorage>(() => appModule.storage);
    gh.lazySingleton<_i15.FlutterLocalNotificationsPlugin>(
        () => appModule.flutterLocalNotificationPlugin);
    gh.lazySingleton<_i16.DiaryRepository>(
        () => _i17.DiaryRepositoryImpl(gh<_i13.DiaryApi>()));
    gh.lazySingleton<_i18.UserAuthRepository>(
        () => _i19.UserAuthRepositoryImpl(gh<_i12.UserAuthApi>()));
    gh.factoryParam<_i20.SignUpViewModel, _i21.SignUpTransmissionModel,
        dynamic>((
      _signUpTransmissionModel,
      _,
    ) =>
        _i20.SignUpViewModel(
          gh<_i18.UserAuthRepository>(),
          _signUpTransmissionModel,
        ));
    gh.factory<_i22.DiaryPageViewModel>(
        () => _i22.DiaryPageViewModel(gh<_i16.DiaryRepository>()));
    gh.factoryParam<_i23.DiaryWriteViewModel, _i24.DiaryItemData?, dynamic>((
      data,
      _,
    ) =>
        _i23.DiaryWriteViewModel(
          gh<_i16.DiaryRepository>(),
          data: data,
        ));
    gh.factory<_i25.WithdrawViewModel>(
        () => _i25.WithdrawViewModel(gh<_i18.UserAuthRepository>()));
    gh.factory<_i26.MyViewModel>(
        () => _i26.MyViewModel(gh<_i18.UserAuthRepository>()));
    gh.factory<_i27.SplashViewModel>(
        () => _i27.SplashViewModel(gh<_i18.UserAuthRepository>()));
    gh.factory<_i28.LoginViewModel>(
        () => _i28.LoginViewModel(gh<_i18.UserAuthRepository>()));
    return this;
  }
}

class _$EventModule extends _i10.EventModule {}

class _$ApiModule extends _i29.ApiModule {}

class _$AppModule extends _i30.AppModule {}
