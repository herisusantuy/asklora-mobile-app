import '../../../core/domain/base_response.dart';
import '../../bot_stock/utils/bot_stock_utils.dart';
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
          await _transactionHistoryApiClient.fetchBotOrderTransactionHistory([
        BotStatus.active.value,
        BotStatus.pending.value,
        BotStatus.closed.value,
        BotStatus.cancel.value
      ]);

      ///todo fetch transfer transaction history when BE ready
      transactions.addAll(List.from(botOrderTransactionHistoryResponse.data
          .map((element) => BotOrderTransactionModel.fromJson(element))));
      return BaseResponse.complete(transactions);
    } catch (e) {
      return BaseResponse.error();
    }
  }
}
