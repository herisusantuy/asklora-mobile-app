import 'transaction_model.dart';

class GroupedTransactionModel {
  final String groupTitle;
  final List<TransactionModel> data;

  GroupedTransactionModel(this.groupTitle, {this.data = const []});

  GroupedTransactionModel copyWith({
    List<TransactionModel>? data,
  }) {
    return GroupedTransactionModel(
      groupTitle,
      data: data ?? this.data,
    );
  }
}
