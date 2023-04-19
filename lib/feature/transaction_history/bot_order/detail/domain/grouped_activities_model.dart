import '../../../domain/grouped_model.dart';
import 'bot_activities_transaction_history_model.dart';

class GroupedActivitiesModel extends GroupedModel {
  final List<BotActivitiesTransactionHistoryModel> data;

  const GroupedActivitiesModel(
      {required GroupType groupType,
      required String groupTitle,
      this.data = const []})
      : super(groupType: groupType, groupTitle: groupTitle);

  GroupedActivitiesModel copyWith({
    List<BotActivitiesTransactionHistoryModel>? data,
  }) {
    return GroupedActivitiesModel(
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
