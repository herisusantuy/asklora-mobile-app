import 'base_config.dart';

enum EnvironmentType { dev, staging, production }

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const EnvironmentType dev = EnvironmentType.dev;
  static const EnvironmentType staging = EnvironmentType.staging;
  static const EnvironmentType production = EnvironmentType.production;

  late BaseConfig config;

  initConfig(EnvironmentType environmentType) =>
      config = _getConfig(environmentType);

  BaseConfig _getConfig(EnvironmentType environmentType) {
    switch (environmentType) {
      case EnvironmentType.production:
        return ProdConfig();
      case EnvironmentType.staging:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}

class DevConfig implements BaseConfig {
  @override
  String get alpacaApiBaseUrl => 'http://8.210.201.22:8000/devConfig';

  @override
  String get quantApiBaseUrl => 'http://apca.services.asklora.ai/devConfig';

  @override
  String get streamServiceBaseUrl => 'wss://apca.services.asklora.ai/devConfig';
}

class StagingConfig implements BaseConfig {
  @override
  String get alpacaApiBaseUrl => 'http://8.210.201.22:8000/stagingConfig';

  @override
  String get quantApiBaseUrl => 'http://apca.services.asklora.ai/stagingConfig';

  @override
  String get streamServiceBaseUrl =>
      'wss://apca.services.asklora.ai/stagingConfig';
}

class ProdConfig implements BaseConfig {
  @override
  String get alpacaApiBaseUrl => 'http://8.210.201.22:8000/prodConfig';

  @override
  String get quantApiBaseUrl => 'http://apca.services.asklora.ai/prodConfig';

  @override
  String get streamServiceBaseUrl =>
      'wss://apca.services.asklora.ai/prodConfig';
}
