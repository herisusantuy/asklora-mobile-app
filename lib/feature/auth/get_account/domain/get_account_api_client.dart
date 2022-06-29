import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import '../../../../core/domain/asklora/asklora_api_client.dart';

class GetAccountApiClient {
  static GetAccountApiClient? _instance;

  factory GetAccountApiClient() => _instance ??= GetAccountApiClient._();

  GetAccountApiClient._();

  Future<Response> getAccount() async {
    var response = await AskloraApiClient().dio.get(endpointGetAccount);
    return response;
  }
}
