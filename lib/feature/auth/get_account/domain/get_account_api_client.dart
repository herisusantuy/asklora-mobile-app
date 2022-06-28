import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/utils/secure_storage.dart';

class GetAccountApiClient {
  static GetAccountApiClient? _instance;

  factory GetAccountApiClient() => _instance ??= GetAccountApiClient._();

  GetAccountApiClient._();

  Future<Response> getAccount() async {
    var token = await secureStorage.readSecureData('token');
    var options = Options(headers: {'Authorization': 'Bearer $token'});
    var response =
        await AskloraApiClient().dio.get(endpointGetAccount, options: options);
    return response;
  }
}
