import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';

class TransactionHistoryApiClient {
  Future<Response> fetchBotTransactionHistory() async =>
      await AskloraApiClient().get(
        endpoint: endpointBotTransactionHistory,
      );

  Future<Response> fetchTransferTransactionHistory() async =>
      await AskloraApiClient().get(
        endpoint: endpointTransferTransactionHistory,
      );

  Future<Response> fetchBotTransactionDetail(String orderId) async =>
      await AskloraApiClient()
          .get(endpoint: '$endpointBotOrderHistory/$orderId');
}
