import 'dart:async';

import '../../../../core/domain/base_response.dart';
import '../domain/account_api_client.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/onfido/onfido_result_request.dart';
import '../domain/onfido/onfido_result_response.dart';
import '../domain/onfido/onfido_token_response.dart';
import '../domain/upgrade_account/tax_info_request.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';

class AccountRepository {
  final AccountApiClient _accountApiClient = AccountApiClient();

  Future<GetAccountResponse> getAccount() async {
    var response = await _accountApiClient.getAccount();
    return GetAccountResponse.fromJson(response.data);
  }

  Future<BaseResponse<bool>> upgradeAccount(
      UpgradeAccountRequest upgradeAccountRequest) async {
    // TODO: Change this API flow according to the new flow.
    try {
      _accountApiClient.upgradeAccount(upgradeAccountRequest);
      return BaseResponse.complete(true);
    } catch (e) {
      return BaseResponse.error('Invalid Request');
    }
  }

  Future<BaseResponse<OnfidoTokenResponse>> getOnfidoToken() async {
    try {
      var response = await _accountApiClient.getOnfidoToken();
      return BaseResponse.complete(OnfidoTokenResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error('Could not fetch the token!');
    }
  }

  Future<BaseResponse<OnfidoResultResponse>> updateKycResult(
      OnfidoResultRequest request) async {
    try {
      var response = await _accountApiClient.updateKycResult(request);
      return BaseResponse.complete(
          OnfidoResultResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error('Could not update the Onfido result!');
    }
  }

  Future<bool> submitTaxInfo(TaxInfoRequest request) async {
    // TODO: Change this API flow according to the new flow.
    try {
      await _accountApiClient.submitTaxInfo(request);
      return true;
    } catch (e) {
      return (e.toString() == 'Invalid request');
    }
  }
}
