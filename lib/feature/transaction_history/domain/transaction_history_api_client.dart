import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'bot_transaction_history_request.dart';

class TransactionHistoryApiClient {
  Future<Response> fetchBotTransactionHistory(
          BotTransactionHistoryRequest botTransactionHistoryRequest) async =>
      await AskloraApiClient().post(
        endpoint: endpointBotTransactionHistory,
        payload: jsonEncode(botTransactionHistoryRequest.toJson()),
      );

  Future<Response> fetchTransferTransactionHistory() async =>
      await AskloraApiClient().get(
        endpoint: endpointTransferTransactionHistory,
      );

  Future<Response> fetchBotTransactionDetail(String orderId) async =>
      await AskloraApiClient()
          .get(endpoint: '$endpointBotOrderHistory/$orderId');
}
