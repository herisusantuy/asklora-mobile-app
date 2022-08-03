import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/bank_details.dart';

class ListBankRepository {
  Future<List<BankDetails>> getListBank() async {
    final String response =
        await rootBundle.loadString('assets/json/bank_lists.json');

    Iterable iterable = json.decode(response);
    return List<BankDetails>.from(
        iterable.map((model) => BankDetails.fromJson(model)));
  }
}
