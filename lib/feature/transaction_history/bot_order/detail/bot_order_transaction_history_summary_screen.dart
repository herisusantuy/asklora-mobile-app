part of 'bot_order_transaction_history_detail_screen.dart';

class BotOrderTransactionHistorySummaryScreen extends StatelessWidget {
  final List<BotSummaryTransactionHistoryModel> summaries;

  const BotOrderTransactionHistorySummaryScreen(
      {required this.summaries, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: summaries
            .map((e) => Column(
                  children: [
                    TransactionHistoryGroupTitle(
                      title: e.createdFormattedString,
                    ),
                    BotOrderTransactionHistorySummaryCard(
                      title: S.of(context).botStockId,
                      subTitle: e.pk,
                      showBottomBorder: true,
                    ),
                    BotOrderTransactionHistorySummaryCard(
                      title: S.of(context).investmentAmount,
                      subTitle: e.investmentAmountString,
                      showBottomBorder: true,
                    ),
                    BotOrderTransactionHistorySummaryCard(
                      title: S.of(context).tradeFee,
                      subTitle: 'HKD40.0',
                      showBottomBorder:
                          summaries.indexOf(e) == summaries.length - 1,
                    ),
                  ],
                ))
            .toList(),
      );
}
