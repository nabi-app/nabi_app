// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:event_bus/event_bus.dart' as _i6;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i12;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nabi_app/data/respository/diary_repository_impl.dart' as _i14;
import 'package:nabi_app/data/respository/user_auth_repository_impl.dart'
    as _i16;
import 'package:nabi_app/data/source/diary_api.dart' as _i10;
import 'package:nabi_app/data/source/user_auth_api.dart' as _i9;
import 'package:nabi_app/domain/model/diary_item_data.dart' as _i21;
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart' as _i18;
import 'package:nabi_app/domain/repository/diary_repository.dart' as _i13;
import 'package:nabi_app/domain/repository/user_auth_repository.dart' as _i15;
import 'package:nabi_app/module/api_module.dart' as _i24;
import 'package:nabi_app/module/app_module.dart' as _i25;
import 'package:nabi_app/module/event_module.dart' as _i7;
import 'package:nabi_app/presentaion/diary/diary_page_view_model.dart' as _i19;
import 'package:nabi_app/presentaion/diary/diary_write_view_model.dart' as _i20;
import 'package:nabi_app/presentaion/goal/goal_write_view_model.dart' as _i4;
import 'package:nabi_app/presentaion/goal/nabi_custom_view_model.dart' as _i3;
import 'package:nabi_app/presentaion/login/login_view_model.dart' as _i23;
import 'package:nabi_app/presentaion/sign_up/sign_up_view_model.dart' as _i17;
import 'package:nabi_app/presentaion/splash/splash_view_model.dart' as _i22;
import 'package:nabi_app/user/auth_provider.dart' as _i5;

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
    gh.factory<_i3.NabiCustomViewModel>(() => _i3.NabiCustomViewModel());
    gh.factory<_i4.GoalWriteViewModel>(() => _i4.GoalWriteViewModel());
    gh.singleton<_i5.AuthProvider>(() => _i5.AuthProvider());
    gh.lazySingleton<_i6.EventBus>(() => eventModule.eventBus);
    gh.lazySingleton<_i7.DiaryListRefreshEvent>(() => _i7.DiaryListRefreshEvent());
    gh.lazySingleton<_i8.Dio>(() => apiModule.dio);
    gh.lazySingleton<_i9.UserAuthApi>(() => apiModule.userApi());
    gh.lazySingleton<_i10.DiaryApi>(() => apiModule.diaryApi());
    gh.lazySingleton<_i11.FlutterSecureStorage>(() => appModule.storage);
    gh.lazySingleton<_i12.FlutterLocalNotificationsPlugin>(
        () => appModule.flutterLocalNotificationPlugin);
    gh.lazySingleton<_i13.DiaryRepository>(
        () => _i14.DiaryRepositoryImpl(gh<_i10.DiaryApi>()));
    gh.lazySingleton<_i15.UserAuthRepository>(
        () => _i16.UserAuthRepositoryImpl(gh<_i9.UserAuthApi>()));
    gh.factoryParam<_i17.SignUpViewModel, _i18.SignUpTransmissionModel,
        dynamic>((
      _signUpTransmissionModel,
      _,
    ) =>
        _i17.SignUpViewModel(
          gh<_i15.UserAuthRepository>(),
          _signUpTransmissionModel,
        ));
    gh.factory<_i19.DiaryPageViewModel>(
        () => _i19.DiaryPageViewModel(gh<_i13.DiaryRepository>()));
    gh.factoryParam<_i20.DiaryWriteViewModel, _i21.DiaryItemData?, dynamic>((
      data,
      _,
    ) =>
        _i20.DiaryWriteViewModel(
          gh<_i13.DiaryRepository>(),
          data: data,
        ));
    gh.factory<_i22.SplashViewModel>(
        () => _i22.SplashViewModel(gh<_i15.UserAuthRepository>()));
    gh.factory<_i23.LoginViewModel>(
        () => _i23.LoginViewModel(gh<_i15.UserAuthRepository>()));
    return this;
  }
}

class _$EventModule extends _i7.EventModule {}

class _$ApiModule extends _i24.ApiModule {}

class _$AppModule extends _i25.AppModule {}
