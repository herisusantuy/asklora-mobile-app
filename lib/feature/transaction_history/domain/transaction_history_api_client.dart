import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'transaction_history_request.dart';

class TransactionHistoryApiClient {
  Future<Response> fetchTransactionHistory(
          TransactionHistoryRequest transactionHistoryRequest) async =>
      await AskloraApiClient().get(
          endpoint: endpointTransactionHistory,
          queryParameters: transactionHistoryRequest.toJson());

  Future<Response> fetchBotTransactionDetail(String orderId) async =>
      await AskloraApiClient()
          .get(endpoint: '$endpointBotOrderHistory/$orderId');
}
