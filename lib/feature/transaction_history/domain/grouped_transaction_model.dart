import 'transaction_model.dart';

enum GroupType { today, others }

class GroupedTransactionModel {
  final GroupType groupType;
  final String groupTitle;
  final List<TransactionModel> data;

  GroupedTransactionModel(
      {required this.groupType,
      required this.groupTitle,
      this.data = const []});

  GroupedTransactionModel copyWith({
    List<TransactionModel>? data,
  }) {
    return GroupedTransactionModel(
      groupType: groupType,
      groupTitle: groupTitle,
      data: data ?? this.data,
    );
  }
}
