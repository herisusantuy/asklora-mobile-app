import '../../../core/domain/base_response.dart';
import '../domain/transaction_history_api_client.dart';
import '../domain/transaction_model.dart';

class TransactionHistoryRepository {
  final TransactionHistoryApiClient _transactionHistoryApiClient =
      TransactionHistoryApiClient();

  Future<BaseResponse<List<TransactionModel>>>
      fetchTransactionsHistory() async {
    try {
      List<TransactionModel> transactions = [];
      var botOrderTransactionHistoryResponse =
          await _transactionHistoryApiClient.fetchBotOrderTransactionHistory();

      ///todo fetch transfer transaction history when BE ready
      transactions.addAll(List.from(botOrderTransactionHistoryResponse.data
          .map((element) => BotOrderTransactionModel.fromJson(element))));
      return BaseResponse.complete(transactions);
    } catch (e) {
      return BaseResponse.error();
    }
  }
}
