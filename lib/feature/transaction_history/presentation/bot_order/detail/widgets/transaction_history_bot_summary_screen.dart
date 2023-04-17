part of '../bot_transaction_history_detail_screen.dart';

class TransactionHistoryBotSummaryScreen extends StatelessWidget {
  final List<BotSummaryTransactionModel> summaries;

  const TransactionHistoryBotSummaryScreen({required this.summaries, Key? key})
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
                      title: 'Botstock ID',
                      subTitle: e.pk,
                      showBottomBorder: true,
                    ),
                    BotOrderTransactionHistorySummaryCard(
                      title: 'Investment Amount',
                      subTitle: e.investmentAmountString,
                      showBottomBorder: true,
                    ),
                    BotOrderTransactionHistorySummaryCard(
                      title: 'Trade Fee',
                      subTitle: 'HKD40.0',
                      showBottomBorder:
                          summaries.indexOf(e) == summaries.length - 1,
                    ),
                  ],
                ))
            .toList(),
      );
}
