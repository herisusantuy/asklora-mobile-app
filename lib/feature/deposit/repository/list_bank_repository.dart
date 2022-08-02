import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/list_bank.dart';

class ListBankRepository {
  Future<List<ListBanks>> getListBank() async {
    final String response =
        await rootBundle.loadString('assets/json/bank_lists.json');

    Iterable iterable = json.decode(response);
    return List<ListBanks>.from(
        iterable.map((model) => ListBanks.fromJson(model)));
  }
}
