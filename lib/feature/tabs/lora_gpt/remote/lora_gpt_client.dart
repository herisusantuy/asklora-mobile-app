import '../../../../core/data/remote/base_api_client.dart';
import '../../../../core/domain/endpoints.dart';

class LoraGptApiClient extends BaseApiClient {
  LoraGptApiClient._internal() : super();

  static final _singleton = LoraGptApiClient._internal();

  factory LoraGptApiClient() => _singleton;

  @override
  String get baseUrl => loraGptBaseUrl;

  @override
  String get token => 'Bearer 90u1-6+pn2=as91jk';
}
