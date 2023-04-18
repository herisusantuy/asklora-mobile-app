part of '../bot_transaction_history_detail_screen.dart';

class TransactionHistoryBotActivitiesScreen extends StatelessWidget {
  const TransactionHistoryBotActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<
          BotTransactionHistoryDetailBloc, BotTransactionHistoryDetailState>(
        buildWhen: (previous, current) =>
            previous.activities != current.activities,
        builder: (context, state) => ListView(
          children: state.activities
              .map((e) => TransactionHistoryBotActivitiesGroupWidget(
                  title: e.groupType == GroupType.today
                      ? S.of(context).transactionHistoryToday
                      : e.groupTitle,
                  data: e.data,
                  showBottomBorder: state.activities.indexOf(e) ==
                      state.activities.length - 1))
              .toList(),
        ),
      );
}
