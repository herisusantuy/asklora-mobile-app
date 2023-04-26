import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';

class TransactionHistoryApiClient {
  Future<Response> fetchBotOrderTransactionHistory(List<String> status) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotOrderHistory,
          payload: jsonEncode({'status': status}));

  Future<Response> fetchBotTransactionDetail(String orderId) async =>
      await AskloraApiClient()
          .get(endpoint: '$endpointBotOrderHistory/$orderId');
}
