import 'package:asklora_mobile_app/core/domain/transaction/transaction_balance_request.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';

class TransactionApiClient {
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
          .get(endpoint: '$endpointBotTransactionHistory/$orderId');

  Future<Response> fetchBalance(
          TransactionBalanceRequest transactionBalanceRequest) async =>
      await AskloraApiClient().get(
          endpoint: endpointBalance,
          queryParameters: transactionBalanceRequest.toJson());
}
