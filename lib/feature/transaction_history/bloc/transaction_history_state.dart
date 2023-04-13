part of 'transaction_history_bloc.dart';

class TransactionHistoryState extends Equatable {
  const TransactionHistoryState({
    this.response = const BaseResponse(),
    this.transactions = const [],
  });

  final BaseResponse<List<TransactionModel>> response;
  final List<GroupedTransactionModel> transactions;

  @override
  List<Object?> get props {
    return [
      response,
      transactions
    ];
  }

  TransactionHistoryState copyWith({
    BaseResponse<List<TransactionModel>>? response,
    List<GroupedTransactionModel>? transactions,
  }) {
    return TransactionHistoryState(
      response: response ?? this.response,
      transactions: transactions ?? this.transactions,
    );
  }
}
