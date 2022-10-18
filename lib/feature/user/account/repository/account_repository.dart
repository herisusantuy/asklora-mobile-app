import 'dart:async';

import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../../kyc/domain/onfido_token_response.dart';
import '../domain/account_api_client.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/tax_info_request.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';

class AccountRepository {
  final AccountApiClient _accountApiClient = AccountApiClient();

  Future<GetAccountResponse> getAccount() async {
    var response = await _accountApiClient.getAccount();
    return GetAccountResponse.fromJson(response.data);
  }

  Future<bool> upgradeAccount(
      UpgradeAccountRequest upgradeAccountRequest) async {
    // Hack: Let the user go to Onfido KYC even if he tried to upgrade the account again.
    try {
      var response =
          await _accountApiClient.upgradeAccount(upgradeAccountRequest);
      //return UpgradeAccountRequest.fromJson(response.data);
      return true;
    } catch (e) {
      return (e.toString() == 'Invalid request');
    }
  }

  Future<OnfidoTokenResponse> getOnfidoToken() async {
    var response = await _accountApiClient.getOnfidoToken();
    return OnfidoTokenResponse.fromJson(response.data);
  }

  Future<OnfidoResultResponse> updateKycResult(
      OnfidoResultRequest request) async {
    var response = await _accountApiClient.updateKycResult(request);
    return OnfidoResultResponse.fromJson(response.data);
  }

  Future<bool> submitTaxInfo(TaxInfoRequest request) async {
    // Hack: Let the user go to Onfido KYC even if he tried to upgrade the account again.
    try {
      var response = await _accountApiClient.submitTaxInfo(request);
      //TaxInfoRequest.fromJson(response.data);
      return true;
    } catch (e) {
      return (e.toString() == 'Invalid request');
    }
  }
}
