part of '../bot_order_transaction_history_detail_screen.dart';

class BotOrderTransactionHistoryDetailContent extends StatelessWidget {
  final List<BotSummaryTransactionHistoryModel> summaries;
  final String botStatus;
  final String title;
  late final BotStatus botStatusType;

  BotOrderTransactionHistoryDetailContent(
      {required this.title,
      required this.summaries,
      required this.botStatus,
      Key? key})
      : super(key: key) {
    botStatusType = BotStatus.findByString(botStatus);
  }

  @override
  Widget build(BuildContext context) {
    return TransactionHistoryTabScreen(header: _header(context), tabs: [
      S.of(context).summary,
      S.of(context).activities
    ], tabViews: [
      BotOrderTransactionHistorySummaryScreen(
          summaries: summaries, botStatusType: botStatusType),
      const BotOrderTransactionHistoryActivitiesScreen(),
    ]);
  }

  Widget _header(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 24,
                      )),
                )),
            Expanded(
              flex: 5,
              child: Center(
                child: CustomTextNew(
                  title,
                  style: AskLoraTextStyles.h5,
                ),
              ),
            ),
            Flexible(
                flex: 3,
                child: Align(
                    alignment: Alignment.centerRight, child: _statusWidget()))
          ],
        ),
      );

  Widget _statusWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.4, color: botStatusType.color),
      ),
      child: CustomTextNew(
        botStatusType.name,
        style: AskLoraTextStyles.subtitle3.copyWith(color: botStatusType.color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
