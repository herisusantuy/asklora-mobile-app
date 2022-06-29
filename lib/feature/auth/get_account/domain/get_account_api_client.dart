import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/domain/repository/auth_repository.dart';

class GetAccountApiClient {
  static GetAccountApiClient? _instance;

  factory GetAccountApiClient() => _instance ??= GetAccountApiClient._();

  GetAccountApiClient._();

  Future<Response> getAccount() async {
    var token = await AuthRepository().getAccessToken();
    var options = Options(headers: {'Authorization': 'Bearer $token'});
    var response =
        await AskloraApiClient().dio.get(endpointGetAccount, options: options);
    return response;
  }
}
