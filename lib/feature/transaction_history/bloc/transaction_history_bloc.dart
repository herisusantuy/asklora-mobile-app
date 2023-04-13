import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/domain/base_response.dart';
import '../../bot_stock/repository/bot_stock_repository.dart';
import '../domain/grouped_transaction_model.dart';
import '../domain/transaction_model.dart';

part 'transaction_history_event.dart';

part 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryBloc({required BotStockRepository botStockRepository})
      : _botStockRepository = botStockRepository,
        super(const TransactionHistoryState()) {
    on<FetchTransaction>(_onFetchTransaction);
    on<FilterTransaction>(_onFilterByBotOrderTransaction);
  }

  final BotStockRepository _botStockRepository;

  _onFetchTransaction(
      FetchTransaction event, Emitter<TransactionHistoryState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var data = await _botStockRepository.fetchBotOrderHistory();
    if (data.state == ResponseState.success) {
      emit(state.copyWith(
          response: data, transactions: groupedNotificationModels(data.data!)));
    }
  }

  _onFilterByBotOrderTransaction(
      FilterTransaction event, Emitter<TransactionHistoryState> emit) async {
    late List<TransactionModel> transactions;
    switch (event.tabIndex) {
      case 1:
        //FILTER TRANSACTION - BOT ORDER
        transactions = state.response.data!
            .where((element) =>
                element.transactionHistoryType ==
                TransactionHistoryType.botOrder)
            .toList();
        break;
      case 2:
        //FILTER TRANSACTION - TRANSFER
        transactions = state.response.data!
            .where((element) =>
                element.transactionHistoryType ==
                TransactionHistoryType.transfer)
            .toList();
        break;
      default:
        //FILTER TRANSACTION - ALL
        transactions = state.response.data!;
        break;
    }
    emit(state.copyWith(transactions: groupedNotificationModels(transactions)));
  }

  List<GroupedTransactionModel> groupedNotificationModels(
      List<TransactionModel> transactions) {
    List<GroupedTransactionModel> groupedTransactions = [];
    DateTime dateTimeNow = DateTime.now();
    DateTime dateNow =
        DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    for (var element in transactions) {
      DateTime createdAt = DateTime.parse(
          DateFormat('yyyy-MM-dd').format(DateTime.parse(element.date!)));
      if (createdAt.compareTo(dateNow) == 0) {
        int groupIndex = groupedTransactions
            .indexWhere((element) => element.groupTitle == 'Today');
        if (groupIndex >= 0) {
          ///ADD EXISTING GROUP TODAY
          groupedTransactions[groupIndex] = groupedTransactions[groupIndex]
              .copyWith(
                  data: List.from(groupedTransactions[groupIndex].data)
                    ..add(element));
        } else {
          ///CREATE NEW GROUP TODAY
          groupedTransactions
              .add(GroupedTransactionModel('Today', data: [element]));
        }
      } else {
        ///CREATE OTHER GROUP EACH DATE
        String createdAtFormatted = DateFormat('yyyy-MM-dd').format(createdAt);
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
          groupedTransactions.add(
              GroupedTransactionModel(createdAtFormatted, data: [element]));
        }
      }
    }
    return groupedTransactions;
  }
}
