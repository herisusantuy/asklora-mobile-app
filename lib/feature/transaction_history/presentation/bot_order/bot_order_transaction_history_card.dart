part of '../transaction_history_screen.dart';

class BotOrderTransactionHistoryCard extends StatelessWidget {
  final BotOrderTransactionModel botOrderTransactionModel;
  final bool showBottomBorder;

  const BotOrderTransactionHistoryCard(
      {required this.botOrderTransactionModel,
      required this.showBottomBorder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BotTransactionHistoryDetailScreen.open(
          context, botOrderTransactionModel),
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
                          child: CustomTextNew(
                              botOrderTransactionModel.titleString)),
                      if (botOrderTransactionModel.isDummy)
                        const FreeBotBadge(),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                CustomTextNew(
                  'HKD ${botOrderTransactionModel.amountString}',
                  style: AskLoraTextStyles.subtitle2,
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            CustomTextNew(
              BotStatus.findByString(botOrderTransactionModel.statusString)
                  .name,
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.darkGray),
            )
          ],
        ),
      ),
    );
  }
}
