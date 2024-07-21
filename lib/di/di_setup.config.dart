// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nabi_app/data/respository/diary_repository_impl.dart' as _i13;
import 'package:nabi_app/data/respository/user_auth_repository_impl.dart'
    as _i15;
import 'package:nabi_app/data/source/diary_api.dart' as _i9;
import 'package:nabi_app/data/source/user_auth_api.dart' as _i8;
import 'package:nabi_app/di/api_module.dart' as _i21;
import 'package:nabi_app/di/app_module.dart' as _i22;
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart' as _i17;
import 'package:nabi_app/domain/repository/diary_repository.dart' as _i12;
import 'package:nabi_app/domain/repository/user_auth_repository.dart' as _i14;
import 'package:nabi_app/presentaion/diary/diary_page_view_model.dart' as _i18;
import 'package:nabi_app/presentaion/diary/diary_write_view_model.dart' as _i3;
import 'package:nabi_app/presentaion/goal/goal_write_view_model.dart' as _i5;
import 'package:nabi_app/presentaion/goal/nabi_custom_view_model.dart' as _i4;
import 'package:nabi_app/presentaion/login/login_view_model.dart' as _i20;
import 'package:nabi_app/presentaion/sign_up/sign_up_view_model.dart' as _i16;
import 'package:nabi_app/presentaion/splash/splash_view_model.dart' as _i19;
import 'package:nabi_app/user/auth_provider.dart' as _i6;

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
    final apiModule = _$ApiModule();
    final appModule = _$AppModule();
    gh.factory<_i3.DiaryWriteViewModel>(() => _i3.DiaryWriteViewModel());
    gh.factory<_i4.NabiCustomViewModel>(() => _i4.NabiCustomViewModel());
    gh.factory<_i5.GoalWriteViewModel>(() => _i5.GoalWriteViewModel());
    gh.singleton<_i6.AuthProvider>(() => _i6.AuthProvider());
    gh.lazySingleton<_i7.Dio>(() => apiModule.dio);
    gh.lazySingleton<_i8.UserAuthApi>(() => apiModule.userApi());
    gh.lazySingleton<_i9.DiaryApi>(() => apiModule.diaryApi());
    gh.lazySingleton<_i10.FlutterSecureStorage>(() => appModule.storage);
    gh.lazySingleton<_i11.FlutterLocalNotificationsPlugin>(
        () => appModule.flutterLocalNotificationPlugin);
    gh.lazySingleton<_i12.DiaryRepository>(
        () => _i13.DiaryRepositoryImpl(gh<_i9.DiaryApi>()));
    gh.lazySingleton<_i14.UserAuthRepository>(
        () => _i15.UserAuthRepositoryImpl(gh<_i8.UserAuthApi>()));
    gh.factoryParam<_i16.SignUpViewModel, _i17.SignUpTransmissionModel,
        dynamic>((
      _signUpTransmissionModel,
      _,
    ) =>
        _i16.SignUpViewModel(
          gh<_i14.UserAuthRepository>(),
          _signUpTransmissionModel,
        ));
    gh.factory<_i18.DiaryPageViewModel>(
        () => _i18.DiaryPageViewModel(gh<_i12.DiaryRepository>()));
    gh.factory<_i19.SplashViewModel>(
        () => _i19.SplashViewModel(gh<_i14.UserAuthRepository>()));
    gh.factory<_i20.LoginViewModel>(
        () => _i20.LoginViewModel(gh<_i14.UserAuthRepository>()));
    return this;
  }
}

class _$ApiModule extends _i21.ApiModule {}

class _$AppModule extends _i22.AppModule {}
