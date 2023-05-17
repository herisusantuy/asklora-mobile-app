import '../../../core/domain/base_response.dart';
import '../../../core/utils/date_utils.dart';
import '../bot_order/detail/domain/bot_activities_transaction_history_model.dart';
import '../bot_order/detail/domain/bot_detail_transaction_history_response.dart';
import '../domain/grouped_model.dart';
import '../domain/grouped_transaction_model.dart';
import '../domain/transaction_history_api_client.dart';
import '../domain/transaction_history_model.dart';

class TransactionHistoryRepository {
  final TransactionHistoryApiClient _transactionHistoryApiClient =
      TransactionHistoryApiClient();

  Future<BaseResponse<List<GroupedTransactionModel>>>
      fetchAllTransactionsHistory() async {
    try {
      var botTransactionHistory =
          await _transactionHistoryApiClient.fetchBotTransactionHistory();
      var transferTransactionHistory =
          await _transactionHistoryApiClient.fetchTransferTransactionHistory();

      return BaseResponse.complete(groupedTransactionModels([
        ...List.from(botTransactionHistory.data
            .map((element) => TransactionHistoryModel.fromJson(element))),
        ...List.from(transferTransactionHistory.data
            .map((element) => TransactionHistoryModel.fromJson(element)))
      ]..sort((a, b) => b.created.compareTo(a.created))));
    } catch (e) {
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<List<GroupedTransactionModel>>>
      fetchBotTransactionsHistory() async {
    try {
      var response =
          await _transactionHistoryApiClient.fetchBotTransactionHistory();

      return BaseResponse.complete(groupedTransactionModels(List.from(response
          .data
          .map((element) => TransactionHistoryModel.fromJson(element)))));
    } catch (e) {
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<List<GroupedTransactionModel>>>
      fetchTransferTransactionsHistory() async {
    try {
      var response =
          await _transactionHistoryApiClient.fetchTransferTransactionHistory();

      return BaseResponse.complete(groupedTransactionModels(List.from(response
          .data
          .map((element) => TransactionHistoryModel.fromJson(element)))));
    } catch (e) {
      return BaseResponse.error();
    }
  }

  List<GroupedTransactionModel> groupedTransactionModels(
      List<TransactionHistoryModel> transactions) {
    List<GroupedTransactionModel> groupedTransactions = [];
    DateTime dateTimeNow = DateTime.now();
    DateTime dateNow =
        DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    for (var element in transactions) {
      DateTime createdAt = formatDateOnly(element.created);
      if (createdAt.compareTo(dateNow) == 0) {
        int groupIndex = groupedTransactions
            .indexWhere((element) => element.groupType == GroupType.today);
        if (groupIndex >= 0) {
          ///ADD EXISTING GROUP TODAY
          groupedTransactions[groupIndex] = groupedTransactions[groupIndex]
              .copyWith(
                  data: List.from(groupedTransactions[groupIndex].data)
                    ..add(element));
        } else {
          ///CREATE NEW GROUP TODAY
          groupedTransactions.add(GroupedTransactionModel(
              groupType: GroupType.today, groupTitle: '', data: [element]));
        }
      } else {
        ///CREATE OTHER GROUP EACH DATE
        String createdAtFormatted = formatDateTimeAsString(createdAt);
        int groupIndex = groupedTransactions
            .indexWhere((element) => element.groupTitle == createdAtFormatted);
        if (groupIndex >= 0) {
          ///ADD EXISTING GROUP
          groupedTransactions[groupIndex] = groupedTransactions[groupIndex]
              .copyWith(
                  data: List.from(groupedTransactions[groupIndex].data)
                    ..add(element));
        } else {
          ///CREATE NEW GROUP
          groupedTransactions.add(GroupedTransactionModel(
              groupType: GroupType.others,
              groupTitle: createdAtFormatted,
              data: [element]));
        }
      }
    }
    return groupedTransactions;
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
