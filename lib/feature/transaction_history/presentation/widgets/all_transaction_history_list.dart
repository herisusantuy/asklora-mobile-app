part of '../transaction_history_screen.dart';

class AllTransactionHistoryList extends StatelessWidget {
  const AllTransactionHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
        buildWhen: (previous, current) =>
            previous.allTransactions != current.allTransactions,
        builder: (context, state) => ListView(
          children: state.allTransactions
              .map((e) => TransactionHistoryGroupWidget(
                  title: e.groupType == GroupType.today
                      ? S.of(context).transactionHistoryToday
                      : e.groupTitle,
                  data: e.data,
                  showBottomBorder: state.allTransactions.indexOf(e) ==
                      state.allTransactions.length - 1))
              .toList(),
        ),
      );
}
