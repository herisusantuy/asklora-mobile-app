part of '../presentation/transaction_history_screen.dart';

class BotOrderTransactionHistoryCard extends StatelessWidget {
  final TransactionHistoryModel transactionHistoryModel;
  final bool showBottomBorder;

  const BotOrderTransactionHistoryCard(
      {required this.transactionHistoryModel,
      required this.showBottomBorder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BotOrderTransactionHistoryDetailScreen.open(
          context, transactionHistoryModel),
      child: Container(
        padding: const EdgeInsets.fromLTRB(17, 21, 17, 26),
        decoration: BoxDecoration(
            border: Border(
                bottom: showBottomBorder
                    ? const BorderSide(color: AskLoraColors.gray, width: 0.5)
                    : BorderSide.none)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                          child: CustomTextNew(transactionHistoryModel.title)),
                      if (transactionHistoryModel.isDummy) const FreeBotBadge(),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                CustomTextNew(
                  'HKD ${transactionHistoryModel.amountString}',
                  style: AskLoraTextStyles.subtitle2,
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            CustomTextNew(
              BotStatus.findByOmsStatus(transactionHistoryModel.status).name,
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.darkGray),
            )
          ],
        ),
      ),
    );
  }
}
