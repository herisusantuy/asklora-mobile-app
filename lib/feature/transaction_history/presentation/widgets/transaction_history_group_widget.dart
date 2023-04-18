part of '../transaction_history_screen.dart';

class TransactionHistoryGroupWidget extends StatelessWidget {
  final String title;
  final List<TransactionModel> transactions;
  final bool showBottomBorder;

  const TransactionHistoryGroupWidget(
      {required this.title,
      required this.transactions,
      required this.showBottomBorder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: showBottomBorder
                  ? const BorderSide(color: AskLoraColors.gray, width: 0.5)
                  : BorderSide.none)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                AppValues.screenHorizontalPadding.copyWith(top: 8, bottom: 8),
            color: AskLoraColors.whiteSmoke,
            child: CustomTextNew(
              title,
              style: AskLoraTextStyles.subtitle4,
            ),
          ),
          ...transactions
              .map(
                (e) => e is BotOrderTransactionModel
                    ? BotOrderTransactionHistoryCard(
                        botOrderTransactionModel: e,
                        showBottomBorder:
                            transactions.indexOf(e) != transactions.length - 1,
                      )
                    : TransferTransactionHistoryCard(
                        transactionModel: e,
                        showBottomBorder:
                            transactions.indexOf(e) != transactions.length - 1,
                      ),
              )
              .toList()
        ],
      ),
    );
  }
}
