import 'grouped_model.dart';
import 'transaction_model.dart';

class GroupedTransactionModel extends GroupedModel {
  final List<TransactionModel> data;

  const GroupedTransactionModel(
      {required this.data,
      required GroupType groupType,
      required String groupTitle})
      : super(groupType: groupType, groupTitle: groupTitle);

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
