part of '../presentation/transaction_history_screen.dart';

class TransferTransactionHistoryList extends StatelessWidget {
  const TransferTransactionHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
        buildWhen: (previous, current) =>
            previous.transferTransactions != current.transferTransactions,
        builder: (context, state) {
          if (state.transferTransactions.isEmpty) {
            return const EmptyTransactionPlaceholder();
          } else {
            return ListView(
              children: state.transferTransactions
                  .map((e) => TransactionHistoryGroupWidget(
                      title: e.groupTitle,
                      data: e.data,
                      showBottomBorder: state.transferTransactions.indexOf(e) ==
                          state.transferTransactions.length - 1))
                  .toList(),
            );
          }
        },
      );
}
