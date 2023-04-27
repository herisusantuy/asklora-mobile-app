import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../core/domain/base_response.dart';
import '../domain/add_bank_account_request.dart';
import '../domain/bank_account_api_client.dart';
import '../domain/get_bank_account_response.dart';
import '../domain/registered_bank_accounts.dart';
import '../deposits/shareable/bank_list/domain/bank_details.dart';

class BankAccountRepository {
  final BankAccountApiClient _bankDetailsApiClient = BankAccountApiClient();

  Future<BaseResponse<AddBankAccountRequest>> addBankAccount({
    required AddBankAccountRequest addBankAccountRequest,
  }) async {
    var response =
        await _bankDetailsApiClient.addBankAccount(addBankAccountRequest);
    return BaseResponse.complete(AddBankAccountRequest.fromJson(response.data));
  }

  Future<BaseResponse<List<GetBankAccountResponse>>> getBankAccount() async {
    var response = await _bankDetailsApiClient.getBankAccount();
    return BaseResponse.complete(List<GetBankAccountResponse>.from(
        response.data.map((model) => GetBankAccountResponse.fromJson(model))));
  }

  Future<List<BankDetails>> getBankDetails() async {
    final String response =
        await rootBundle.loadString('assets/json/bank_lists.json');

    Iterable iterable = json.decode(response);
    return List<BankDetails>.from(
        iterable.map((model) => BankDetails.fromJson(model)));
  }
}
