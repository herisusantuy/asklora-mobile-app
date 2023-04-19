part of 'bot_order_transaction_history_detail_screen.dart';

class BotOrderTransactionHistorySummaryScreen extends StatelessWidget {
  final BotStatus botStatusType;
  final List<BotSummaryTransactionHistoryModel> summaries;

  const BotOrderTransactionHistorySummaryScreen(
      {required this.summaries, required this.botStatusType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        reverse: true,
        children: summaries.map((e) => _getCard(context, e)).toList(),
      );

  Widget _getCard(BuildContext context,
      BotSummaryTransactionHistoryModel botSummaryTransactionHistoryModel) {
    if (summaries.indexOf(botSummaryTransactionHistoryModel) == 0) {
      return _startedAndRolloverCard(context, botSummaryTransactionHistoryModel,
          S.of(context).orderStarted);
    } else if (botStatusType == BotStatus.closed) {
      return _expiredCard(context, botSummaryTransactionHistoryModel);
    } else {
      return _startedAndRolloverCard(context, botSummaryTransactionHistoryModel,
          S.of(context).orderRollover);
    }
  }

  Widget _startedAndRolloverCard(
      BuildContext context,
      BotSummaryTransactionHistoryModel botSummaryTransactionHistoryModel,
      String additionalTitleInfo) {
    return Column(
      children: [
        TransactionHistoryGroupTitle(
          title:
              '${botSummaryTransactionHistoryModel.createdFormattedString} ($additionalTitleInfo)',
        ),
        BotOrderTransactionHistorySummaryCard(
          title: S.of(context).botStockId,
          subTitle: botSummaryTransactionHistoryModel.pk,
          showBottomBorder: true,
        ),
        BotOrderTransactionHistorySummaryCard(
          title: S.of(context).investmentAmount,
          subTitle: botSummaryTransactionHistoryModel.investmentAmountString,
          showBottomBorder: true,
        ),
        BotOrderTransactionHistorySummaryCard(
          title: S.of(context).tradeFee,
          subTitle: 'HKD40.0',
          showBottomBorder:
              summaries.indexOf(botSummaryTransactionHistoryModel) == 0,
        ),
      ],
    );
  }

  Widget _expiredCard(BuildContext context,
      BotSummaryTransactionHistoryModel botSummaryTransactionHistoryModel) {
    return Column(
      children: [
        TransactionHistoryGroupTitle(
          title:
              '${botSummaryTransactionHistoryModel.createdFormattedString} (${S.of(context).orderExpired})',
        ),
        BotOrderTransactionHistorySummaryCard(
          title: S.of(context).endedAmount,
          subTitle: botSummaryTransactionHistoryModel.investmentAmountString,
          additionalText:
              '${S.of(context).totalPnlIs} ${botSummaryTransactionHistoryModel.finalPnlAmountString}',
          showBottomBorder: true,
        ),
      ],
    );
  }
}
