import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/domain/base_response.dart';
import '../shareable/bank_details/domain/add_bank_account_request.dart';
import '../shareable/bank_details/domain/bank_details_api_client.dart';
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

  Future<List<BankDetails>> getBankDetails() async {
    final String response =
        await rootBundle.loadString('assets/json/bank_lists.json');

    Iterable iterable = json.decode(response);
    return List<BankDetails>.from(
        iterable.map((model) => BankDetails.fromJson(model)));
  }
}
