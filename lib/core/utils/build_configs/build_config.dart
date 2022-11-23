import 'base_config.dart';

enum EnvironmentType { dev, staging, production }

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

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
  String get alpacaApiBaseUrl => 'https://8.210.201.22:8000/';

  @override
  String get askLoraApiBaseUrl => 'https://dev-apca.api.asklora.ai/';

  @override
  String get streamServiceBaseUrl => 'wss://apca.services.asklora.ai/';
}

class StagingConfig implements BaseConfig {
  @override
  String get alpacaApiBaseUrl => 'http://8.210.201.22:8000/stagingConfig';

  @override
  String get askLoraApiBaseUrl => 'https://stag-apca.api.asklora.ai/';

  @override
  String get streamServiceBaseUrl =>
      'wss://apca.services.asklora.ai/stagingConfig';
}

class ProdConfig implements BaseConfig {
  @override
  String get alpacaApiBaseUrl => 'https://8.210.201.22:8000/prodConfig';

  @override
  String get askLoraApiBaseUrl => 'https://apca.api.asklora.ai/';

  @override
  String get streamServiceBaseUrl =>
      'wss://apca.services.asklora.ai/prodConfig';
}
