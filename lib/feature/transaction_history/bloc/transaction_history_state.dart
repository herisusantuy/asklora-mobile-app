part of 'transaction_history_bloc.dart';

class TransactionHistoryState extends Equatable {
  const TransactionHistoryState({
    this.response = const BaseResponse(),
    this.allTransactions = const [],
    this.botOrderTransactions = const [],
    this.transferTransactions = const [],
  });

  final BaseResponse<List<TransactionModel>> response;
  final List<GroupedTransactionModel> allTransactions;
  final List<GroupedTransactionModel> botOrderTransactions;
  final List<GroupedTransactionModel> transferTransactions;

  @override
  List<Object?> get props {
    return [
      response,
      allTransactions,
      botOrderTransactions,
      transferTransactions
    ];
  }

  TransactionHistoryState copyWith({
    BaseResponse<List<TransactionModel>>? response,
    List<GroupedTransactionModel>? allTransactions,
    List<GroupedTransactionModel>? botOrderTransactions,
    List<GroupedTransactionModel>? transferTransactions,
  }) {
    return TransactionHistoryState(
      response: response ?? this.response,
      allTransactions: allTransactions ?? this.allTransactions,
      botOrderTransactions: botOrderTransactions ?? this.botOrderTransactions,
      transferTransactions: transferTransactions ?? this.transferTransactions,
    );
  }
}
