// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nabi_app/data/respository/user_auth_repository_impl.dart'
    as _i10;
import 'package:nabi_app/data/source/user_auth_api.dart' as _i6;
import 'package:nabi_app/di/api_module.dart' as _i15;
import 'package:nabi_app/di/app_module.dart' as _i16;
import 'package:nabi_app/domain/model/sign_up_transmission_model.dart' as _i12;
import 'package:nabi_app/domain/repository/user_auth_repository.dart' as _i9;
import 'package:nabi_app/presentaion/goal/goal_write_view_model.dart' as _i3;
import 'package:nabi_app/presentaion/login/login_view_model.dart' as _i14;
import 'package:nabi_app/presentaion/sign_up/sign_up_view_model.dart' as _i11;
import 'package:nabi_app/presentaion/splash/splash_view_model.dart' as _i13;
import 'package:nabi_app/user/auth_provider.dart' as _i4;

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
    gh.factory<_i3.GoalWriteViewModel>(() => _i3.GoalWriteViewModel());
    gh.singleton<_i4.AuthProvider>(() => _i4.AuthProvider());
    gh.lazySingleton<_i5.Dio>(() => apiModule.dio);
    gh.lazySingleton<_i6.UserAuthApi>(() => apiModule.userApi());
    gh.lazySingleton<_i7.FlutterSecureStorage>(() => appModule.storage);
    gh.lazySingleton<_i8.FlutterLocalNotificationsPlugin>(
        () => appModule.flutterLocalNotificationPlugin);
    gh.lazySingleton<_i9.UserAuthRepository>(
        () => _i10.UserAuthRepositoryImpl(gh<_i6.UserAuthApi>()));
    gh.factoryParam<_i11.SignUpViewModel, _i12.SignUpTransmissionModel,
        dynamic>((
      _signUpTransmissionModel,
      _,
    ) =>
        _i11.SignUpViewModel(
          gh<_i9.UserAuthRepository>(),
          _signUpTransmissionModel,
        ));
    gh.factory<_i13.SplashViewModel>(
        () => _i13.SplashViewModel(gh<_i9.UserAuthRepository>()));
    gh.factory<_i14.LoginViewModel>(
        () => _i14.LoginViewModel(gh<_i9.UserAuthRepository>()));
    return this;
  }
}

class _$ApiModule extends _i15.ApiModule {}

class _$AppModule extends _i16.AppModule {}
