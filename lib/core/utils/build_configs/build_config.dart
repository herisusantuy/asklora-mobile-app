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
  String get ppiBaseUrl => 'http://192.168.100.198:8005/';

  ///redes endpoint
  // @override
  // String get askLoraApiBaseUrl => 'http://192.168.100.198:8002/';

  @override
  String get askLoraApiBaseUrl => 'http://192.168.100.194:8000/';

  @override
  String get streamServiceBaseUrl => 'wss://apca.services.asklora.ai/';
}

class StagingConfig implements BaseConfig {
  @override
  String get ppiBaseUrl => 'http://ppi-stag.api.asklora.ai/';

  @override
  String get askLoraApiBaseUrl => 'https://stag-apca.api.asklora.ai/';

  @override
  String get streamServiceBaseUrl => 'wss://stag-apca.api.asklora.ai/';
}

class ProdConfig implements BaseConfig {
  @override
  String get ppiBaseUrl => 'https://ppi.api.asklora.ai/';

  @override
  String get askLoraApiBaseUrl => 'https://apca.api.asklora.ai/';

  @override
  String get streamServiceBaseUrl =>
      'wss://apca.services.asklora.ai/prodConfig';
}
