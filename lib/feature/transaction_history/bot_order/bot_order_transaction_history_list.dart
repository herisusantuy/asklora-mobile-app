part of '../presentation/transaction_history_screen.dart';

class BotOrderTransactionHistoryList extends StatelessWidget {
  const BotOrderTransactionHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
        buildWhen: (previous, current) =>
            previous.botOrderTransactions != current.botOrderTransactions,
        builder: (context, state) {
          if (state.botOrderTransactions.isEmpty) {
            return const TransactionEmptyWidget();
          } else {
            return ListView(
              children: state.botOrderTransactions
                  .map((e) => TransactionHistoryGroupWidget(
                      title: e.groupType == GroupType.today
                          ? S.of(context).transactionHistoryToday
                          : e.groupTitle,
                      data: e.data,
                      showBottomBorder: state.botOrderTransactions.indexOf(e) ==
                          state.botOrderTransactions.length - 1))
                  .toList(),
            );
          }
        },
      );
}
