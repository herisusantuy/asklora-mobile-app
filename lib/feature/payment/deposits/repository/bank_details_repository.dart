import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/domain/base_response.dart';
import '../shareable/bank_details/domain/add_bank_account_request.dart';
import '../shareable/bank_details/domain/bank_details_api_client.dart';
import '../shareable/bank_details/domain/get_bank_account_response.dart';
import '../shareable/bank_details/domain/registered_bank_account.dart';
import '../shareable/bank_list/domain/bank_details.dart';

class BankDetailsRepository {
  final BankDetailsApiClient _bankDetailsApiClient = BankDetailsApiClient();

  Future<BaseResponse<AddBankAccountRequest>> addBankAccount({
    required AddBankAccountRequest addBankAccountRequest,
  }) async {
    var response =
        await _bankDetailsApiClient.addBankAccount(addBankAccountRequest);
    return BaseResponse.complete(AddBankAccountRequest.fromJson(response.data));
  }

  Future<BaseResponse<RegisteredBankAccount>> getBankAccount() async {
    var response = await _bankDetailsApiClient.getBankAccount();
    return BaseResponse.complete(RegisteredBankAccount(
        List<GetBankAccountResponse>.from(response.data
            .map((model) => GetBankAccountResponse.fromJson(model)))));
  }

  Future<List<BankDetails>> getBankDetails() async {
    final String response =
        await rootBundle.loadString('assets/json/bank_lists.json');

    Iterable iterable = json.decode(response);
    return List<BankDetails>.from(
        iterable.map((model) => BankDetails.fromJson(model)));
  }
}
