//@GeneratedMicroModule;FlyingdartsPackageModule;package:flyingdarts/flyingdarts.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:flyingdarts/src/backend_configuration.dart' as _i6;
import 'package:flyingdarts/src/flavor.dart' as _i5;
import 'package:flyingdarts/src/web_socket_config.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;
import 'package:websocket/websocket.dart' as _i4;

const String _dev = 'dev';
const String _prod = 'prod';
const String _acc = 'acc';

class FlyingdartsPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final flavorModule = _$FlavorModule();
    final backendConfigurationModule = _$BackendConfigurationModule();
    gh.singleton<String>(
      flavorModule.flavorDev,
      instanceName: 'flavor',
      registerFor: {_dev},
    );
    gh.singleton<String>(
      flavorModule.flavorProd,
      instanceName: 'flavor',
      registerFor: {_prod},
    );
    gh.singleton<String>(
      flavorModule.flavorAcc,
      instanceName: 'flavor',
      registerFor: {_acc},
    );
    gh.factory<String>(
      () => backendConfigurationModule.rootWebSocketUriDev,
      instanceName: 'root_websocket_uri',
      registerFor: {
        _dev,
        _acc,
      },
    );
    gh.factory<String>(
      () => backendConfigurationModule.rootWebSocketUriProd,
      instanceName: 'root_websocket_uri',
      registerFor: {_prod},
    );
    gh.factory<_i3.WebSocketConfig>(
      () => backendConfigurationModule
          .config(gh<String>(instanceName: 'root_websocket_uri')),
      registerFor: {
        _dev,
        _acc,
        _prod,
      },
    );
    gh.factory<_i4.WebSocketService<_i4.MessageRequest>>(
      () => backendConfigurationModule
          .webSocketService(gh<_i3.WebSocketConfig>()),
      registerFor: {
        _dev,
        _acc,
        _prod,
      },
    );
  }
}

class _$FlavorModule extends _i5.FlavorModule {}

class _$BackendConfigurationModule extends _i6.BackendConfigurationModule {}
