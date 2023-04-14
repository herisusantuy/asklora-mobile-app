import 'package:equatable/equatable.dart';

import 'transaction_model.dart';

enum GroupType { today, others }

class GroupedTransactionModel extends Equatable {
  final GroupType groupType;
  final String groupTitle;
  final List<TransactionModel> data;

  const GroupedTransactionModel(
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

  @override
  List<Object?> get props {
    return [groupType, groupTitle, data];
  }
}
