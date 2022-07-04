import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import '../../kyc/domain/onfido_result_request.dart';
import 'upgrade_account/upgrade_account_request.dart';

class AccountApiClient {
  static AccountApiClient? _instance;

  factory AccountApiClient() => _instance ??= AccountApiClient._();

  AccountApiClient._();

  Future<Response> getAccount() async {
    var response = await AskloraApiClient().dio.get(endpointGetAccount);
    return response;
  }

  Future<Response> upgradeAccount(UpgradeAccountRequest request) async {
    var response = await AskloraApiClient()
        .dio
        .post(endpointUpgradeAccount, data: jsonEncode(request.toJson()));
    return response;
  }

  Future<Response> getOnfidoToken() async =>
      await AskloraApiClient().dio.get(endpointGetOnfidoToken);

  Future<Response> updateKycResult(OnfidoResultRequest request) async =>
      await AskloraApiClient()
          .dio
          .patch(endpointOnfidoOutcome, data: jsonEncode(request.toJson()));
}
