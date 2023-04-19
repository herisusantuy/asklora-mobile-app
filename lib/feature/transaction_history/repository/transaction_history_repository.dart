import '../../../core/domain/base_response.dart';
import '../../bot_stock/utils/bot_stock_utils.dart';
import '../bot_order/detail/domain/bot_activities_transaction_history_model.dart';
import '../bot_order/detail/domain/bot_detail_transaction_history_response.dart';
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

  Future<BaseResponse<BotDetailTransactionHistoryResponse>>
      fetchBotTransactionsDetail(String orderId) async {
    try {
      var botOrderTransactionHistoryResponse =
          await _transactionHistoryApiClient.fetchBotTransactionDetail(orderId);
      BotDetailTransactionHistoryResponse botDetailTransactionHistoryResponse =
          BotDetailTransactionHistoryResponse.fromJson(
              botOrderTransactionHistoryResponse.data);

      return BaseResponse.complete(botDetailTransactionHistoryResponse.copyWith(
          activities: _addIndexChartData(
              botDetailTransactionHistoryResponse.activities)));
    } catch (e) {
      return BaseResponse.error();
    }
  }

  List<BotActivitiesTransactionHistoryModel> _addIndexChartData(
      List<BotActivitiesTransactionHistoryModel> chartData) {
    List<BotActivitiesTransactionHistoryModel> finalChartData = [];
    int index = 0;
    for (var element in chartData) {
      finalChartData.add(element.copyWith(index: index++));
    }
    return finalChartData;
  }
}
