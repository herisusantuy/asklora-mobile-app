import 'dart:async';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/cache/json_cache_shared_preferences.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../domain/account_api_client.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/onfido/onfido_result_request.dart';
import '../domain/onfido/onfido_result_response.dart';
import '../domain/onfido/onfido_token_response.dart';
import '../domain/upgrade_account/personal_info_request.dart';
import '../domain/upgrade_account/personal_info_response.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../domain/upgrade_account/upgrade_account_response.dart';

class AccountRepository {
  final AccountApiClient _accountApiClient = AccountApiClient();
  final JsonCacheSharedPreferences _jsonCacheSharedPreference =
      JsonCacheSharedPreferences();

  Future<BaseResponse<GetAccountResponse>> getAccount() async {
    try {
      var response = await _accountApiClient.getAccount();
      GetAccountResponse getAccountResponse =
          GetAccountResponse.fromJson(response.data);
      await _jsonCacheSharedPreference.refresh(
          sfKeyAccountData, getAccountResponse);
      return BaseResponse.complete<GetAccountResponse>(getAccountResponse);
    } catch (e) {
      return BaseResponse.error(message: 'Could not get user details!');
    }
  }

  Future<BaseResponse<GetAccountResponse>> getLocalAccount() async {
    var response = await _jsonCacheSharedPreference.value(sfKeyAccountData);
    if (response != null && response.isNotEmpty) {
      return BaseResponse.complete<GetAccountResponse>(
          GetAccountResponse.fromJson(response));
    } else {
      return await getAccount();
    }
  }

  Future<BaseResponse<UpgradeAccountResponse>> submitIBKR(
      UpgradeAccountRequest upgradeAccountRequest) async {
    try {
      var response = await _accountApiClient.submitIBKR(upgradeAccountRequest);
      return BaseResponse.complete(
          UpgradeAccountResponse.fromJson(response.data));
    } catch (_) {
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<PersonalInfoResponse>> submitPersonalInfo(
      {required PersonalInfoRequest personalInfoRequest}) async {
    try {
      var response =
          await _accountApiClient.submitPersonalInfo(personalInfoRequest);
      return BaseResponse.complete(
          PersonalInfoResponse.fromJson(response.data));
    } catch (_) {
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<OnfidoTokenResponse>> getOnfidoToken() async {
    try {
      var response = await _accountApiClient.getOnfidoToken();
      return BaseResponse.complete(OnfidoTokenResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(message: 'Could not fetch the token!');
    }
  }

  Future<BaseResponse<OnfidoResultResponse>> submitOnfidoOutcome(
      OnfidoResultRequest request) async {
    try {
      var response = await _accountApiClient.submitOnfidoOutcome(request);
      return BaseResponse.complete(
          OnfidoResultResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error(message: 'Could not update the Onfido result!');
    }
  }
}
