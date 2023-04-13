import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/grouped_transaction_model.dart';
import '../domain/transaction_model.dart';
import '../repository/transaction_history_repository.dart';

part 'transaction_history_event.dart';

part 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryBloc(
      {required TransactionHistoryRepository transactionHistoryRepository})
      : _transactionHistoryRepository = transactionHistoryRepository,
        super(const TransactionHistoryState()) {
    on<FetchTransaction>(_onFetchTransaction);
  }

  final TransactionHistoryRepository _transactionHistoryRepository;

  _onFetchTransaction(
      FetchTransaction event, Emitter<TransactionHistoryState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var transactionHistory =
        await _transactionHistoryRepository.fetchTransactionsHistory();
    List<TransactionModel> transactions = transactionHistory.data ?? [];
    emit(state.copyWith(
        response: transactionHistory,
        allTransactions: groupedNotificationModels(transactions),
        botOrderTransactions: groupedNotificationModels(transactions
            .where((element) =>
                element.transactionHistoryType ==
                TransactionHistoryType.botOrder)
            .toList()),
        transferTransactions: groupedNotificationModels(transactions
            .where((element) =>
                element.transactionHistoryType ==
                TransactionHistoryType.transfer)
            .toList())));
  }

  List<GroupedTransactionModel> groupedNotificationModels(
      List<TransactionModel> transactions) {
    List<GroupedTransactionModel> groupedTransactions = [];
    DateTime dateTimeNow = DateTime.now();
    DateTime dateNow =
        DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    for (var element in transactions) {
      DateTime createdAt = formatDateOnly(element.date);
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
        String createdAtFormatted = formatDateAsString(createdAt);
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
}
