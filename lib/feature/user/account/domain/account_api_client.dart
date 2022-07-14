import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import '../../kyc/domain/onfido_result_request.dart';
import 'upgrade_account/upgrade_account_request.dart';
import 'upgrade_account/tax_info_request.dart';

class AccountApiClient {
  static AccountApiClient? _instance;

  factory AccountApiClient() => _instance ??= AccountApiClient._();

  AccountApiClient._();

  Future<Response> getAccount() async =>
      await AskloraApiClient().get(endpoint: endpointGetAccount);

  Future<Response> upgradeAccount(UpgradeAccountRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointUpgradeAccount,
          payload: jsonEncode(request.toJson()));

  Future<Response> getOnfidoToken() async =>
      await AskloraApiClient().get(endpoint: endpointGetOnfidoToken);

  Future<Response> updateKycResult(OnfidoResultRequest request) async =>
      await AskloraApiClient().patch(
          endpoint: endpointOnfidoOutcome,
          payload: jsonEncode(request.toJson()));

  Future<Response> submitTaxInfo(TaxInfoRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointTaxInfo, payload: jsonEncode(request.toJson()));
}
