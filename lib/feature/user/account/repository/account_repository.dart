import 'dart:async';

import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../../kyc/domain/onfido_token_response.dart';
import '../domain/account_api_client.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';

class AccountRepository {
  final AccountApiClient _accountApiClient = AccountApiClient();

  Future<GetAccountResponse> getAccount() async {
    var response = await _accountApiClient.getAccount();
    return GetAccountResponse.fromJson(response.data);
  }

  Future<UpgradeAccountRequest> upgradeAccount(
      UpgradeAccountRequest upgradeAccountRequest) async {
    var response =
        await _accountApiClient.upgradeAccount(upgradeAccountRequest);
    return UpgradeAccountRequest.fromJson(response.data);
  }

  Future<OnfidoTokenResponse> getOnfidoToken() async {
    var response = await _accountApiClient.getOnfidoToken();
    return OnfidoTokenResponse.fromJson(response.data);
  }

  Future<OnfidoResultResponse> patchOnfidoOutcome(
      OnfidoResultRequest request) async {
    var response = await _accountApiClient.patchOnfidoOutcome(request);
    return OnfidoResultResponse.fromJson(response.data);
  }
}
