import 'dart:async';

import '../../../../core/domain/base_response.dart';
import '../domain/account_api_client.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/onfido/onfido_result_request.dart';
import '../domain/onfido/onfido_result_response.dart';
import '../domain/onfido/onfido_token_response.dart';
import '../domain/upgrade_account/personal_info_request.dart';
import '../domain/upgrade_account/personal_info_response.dart';
import '../domain/upgrade_account/tax_info_request.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../domain/upgrade_account/upgrade_account_response.dart';

class AccountRepository {
  final AccountApiClient _accountApiClient = AccountApiClient();

  Future<GetAccountResponse> getAccount() async {
    var response = await _accountApiClient.getAccount();
    return GetAccountResponse.fromJson(response.data);
  }

  Future<BaseResponse<UpgradeAccountResponse>> upgradeAccount(
      UpgradeAccountRequest upgradeAccountRequest) async {
    try {
      var response =
          await _accountApiClient.upgradeAccount(upgradeAccountRequest);
      return BaseResponse.complete(
          UpgradeAccountResponse.fromJson(response.data));
    } catch (_) {
      return BaseResponse.error('Invalid Request');
    }
  }

  Future<BaseResponse<PersonalInfoResponse>> submitPersonalInfo(
      PersonalInfoRequest personalInfoRequest) async {
    try {
      var response =
          await _accountApiClient.submitPersonalInfo(personalInfoRequest);
      return BaseResponse.complete(
          PersonalInfoResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(BaseResponse.errorMessage);
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
