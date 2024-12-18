// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:dio/dio.dart' as _i361;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:tatari/app/controllers/auth_controller.dart' as _i772;
import 'package:tatari/app/controllers/splash_controller.dart' as _i936;
import 'package:tatari/app/data/services/common/socket_service.dart' as _i161;
import 'package:tatari/app/utils/helpers/injectable%20properties/injectable_properties.dart' as _i725;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.pref(),
      preResolve: true,
    );
    await gh.factoryAsync<_i982.FirebaseApp>(
      () => registerModule.initializeFireBase(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i772.AuthController>(
      () => _i772.AuthController(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i936.SplashController>(
      () => _i936.SplashController(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i161.SocketService>(() => _i161.SocketService());
    await gh.factoryAsync<_i497.Directory>(
      () => registerModule.temporaryDirectory(),
      instanceName: 'temporary',
      preResolve: true,
    );
    await gh.factoryAsync<_i497.Directory>(
      () => registerModule.documentDirectory(),
      instanceName: 'document',
      preResolve: true,
    );
    gh.lazySingleton<_i725.AppDirectory>(() => _i725.AppDirectory(
          temporaryDirectory: gh<_i497.Directory>(instanceName: 'temporary'),
          documentDirectory: gh<_i497.Directory>(instanceName: 'document'),
        ));
    return this;
  }
}

class _$RegisterModule extends _i725.RegisterModule {}
