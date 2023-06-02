import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../domain/grouped_transaction_model.dart';
import '../domain/transaction_balance_model.dart';
import '../repository/transaction_history_repository.dart';

part 'transaction_history_event.dart';

part 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryBloc(
      {required TransactionHistoryRepository transactionHistoryRepository})
      : _transactionHistoryRepository = transactionHistoryRepository,
        super(const TransactionHistoryState()) {
    on<FetchAllTransaction>(_onFetchAllTransaction);
    on<FetchBotTransaction>(_onFetchBotTransaction);
    on<FetchTransferTransaction>(_onFetchTransferTransaction);
    on<FetchBalance>(_onFetchBalance);
  }

  final TransactionHistoryRepository _transactionHistoryRepository;

  _onFetchAllTransaction(
      FetchAllTransaction event, Emitter<TransactionHistoryState> emit) async {
    emit(state.copyWith(allTransactionsResponse: BaseResponse.loading()));
    var transactionHistory =
        await _transactionHistoryRepository.fetchAllTransactionsHistory();
    emit(state.copyWith(
      allTransactionsResponse: transactionHistory,
    ));
  }

  _onFetchBotTransaction(
      FetchBotTransaction event, Emitter<TransactionHistoryState> emit) async {
    emit(state.copyWith(botTransactionsResponse: BaseResponse.loading()));
    var transactionHistory =
        await _transactionHistoryRepository.fetchBotTransactionsHistory();
    emit(state.copyWith(
      botTransactionsResponse: transactionHistory,
    ));
  }

  _onFetchTransferTransaction(FetchTransferTransaction event,
      Emitter<TransactionHistoryState> emit) async {
    emit(state.copyWith(transferTransactionsResponse: BaseResponse.loading()));
    var transactionHistory =
        await _transactionHistoryRepository.fetchTransferTransactionsHistory();
    emit(state.copyWith(
      transferTransactionsResponse: transactionHistory,
    ));
  }

  _onFetchBalance(
      FetchBalance event, Emitter<TransactionHistoryState> emit) async {
    emit(state.copyWith(transactionBalanceResponse: BaseResponse.loading()));
    var balance = await _transactionHistoryRepository.fetchBalance();
    emit(state.copyWith(transactionBalanceResponse: balance));
  }
}
