import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/data/remote/asklora_api_client.dart';
import '../../../core/domain/endpoints.dart';
import 'add_bank_account_request.dart';

class BankAccountApiClient {
  Future<Response> addBankAccount(AddBankAccountRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBankAccount, payload: jsonEncode(request.toJson()));

  Future<Response> getBankAccount() async =>
      await AskloraApiClient().get(endpoint: endpointBankAccount);
}
