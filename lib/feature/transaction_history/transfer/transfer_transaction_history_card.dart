part of '../presentation/transaction_history_screen.dart';

class TransferTransactionHistoryCard extends StatelessWidget {
  final TransactionHistoryModel transactionHistoryModel;
  final bool showBottomBorder;

  const TransferTransactionHistoryCard(
      {required this.transactionHistoryModel,
      required this.showBottomBorder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => TransferTransactionHistoryDetailScreen.open(
          context, transactionHistoryModel),
      child: Container(
        padding: const EdgeInsets.fromLTRB(17, 21, 17, 26),
        decoration: BoxDecoration(
          border: Border(
              bottom: showBottomBorder
                  ? const BorderSide(color: AskLoraColors.gray, width: 0.5)
                  : BorderSide.none),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextNew(transactionHistoryModel.title),
                ),
                const SizedBox(
                  width: 14,
                ),
                CustomTextNew(
                  '${transactionHistoryModel.transferType.punctuation}HKD ${transactionHistoryModel.amountString}',
                  style: AskLoraTextStyles.subtitle2.copyWith(
                      color: transactionHistoryModel.transferType.color),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            CustomTextNew(
              transactionHistoryModel.transferStatus.name,
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.darkGray),
            )
          ],
        ),
      ),
    );
  }
}
