import 'dart:convert';

import 'package:flutter/services.dart';

import '../domain/bank_details.dart';

class BankDetailsRepository {
  Future<List<BankDetails>> getBankDetails() async {
    final String response =
        await rootBundle.loadString('assets/json/bank_lists.json');

    Iterable iterable = json.decode(response);
    return List<BankDetails>.from(
        iterable.map((model) => BankDetails.fromJson(model)));
  }
}
