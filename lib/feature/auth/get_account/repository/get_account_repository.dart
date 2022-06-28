import 'dart:async';

import '../domain/get_account_api_client.dart';
import '../domain/get_account_response.dart';

class GetAccountRepository {
  late GetAccountApiClient _getAccountApiClient;

  GetAccountRepository() {
    _getAccountApiClient = GetAccountApiClient();
  }

  Future<GetAccountResponse> getAccount() async {
    var response = await _getAccountApiClient.getAccount();
    return GetAccountResponse.fromJson(response.data);
  }
}
