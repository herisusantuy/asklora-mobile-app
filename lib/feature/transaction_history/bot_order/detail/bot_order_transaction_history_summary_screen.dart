part of 'bot_order_transaction_history_detail_screen.dart';

class BotOrderTransactionHistorySummaryScreen extends StatelessWidget {
  final BotStatus botStatusType;

  const BotOrderTransactionHistorySummaryScreen(
      {required this.botStatusType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<
          BotTransactionHistoryDetailBloc, BotTransactionHistoryDetailState>(
      buildWhen: (previous, current) =>
          previous.response.state != current.response.state,
      builder: (context, state) {
        return ListView(
          reverse: true,
          children: (state.response.data?.summary ?? [])
              .map((e) =>
                  _getCard(context, e, state.response.data?.summary.indexOf(e)))
              .toList(),
        );
      });

  Widget _getCard(
      BuildContext context,
      BotSummaryTransactionHistoryModel botSummaryTransactionHistoryModel,
      int? index) {
    if (index == 0) {
      return _startedAndRolloverCard(context, botSummaryTransactionHistoryModel,
          S.of(context).orderStarted, index);
    } else if (botStatusType == BotStatus.closed) {
      return _expiredCard(context, botSummaryTransactionHistoryModel);
    } else {
      return _startedAndRolloverCard(context, botSummaryTransactionHistoryModel,
          S.of(context).orderRollover, index);
    }
  }

  Widget _startedAndRolloverCard(
      BuildContext context,
      BotSummaryTransactionHistoryModel botSummaryTransactionHistoryModel,
      String additionalTitleInfo,
      int? index) {
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
          showBottomBorder: index == 0,
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
