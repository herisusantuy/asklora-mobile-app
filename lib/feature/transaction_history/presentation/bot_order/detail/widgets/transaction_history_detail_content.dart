part of '../bot_transaction_history_detail_screen.dart';

class TransactionHistoryContent extends StatelessWidget {
  final List<BotSummaryTransactionModel> summaries;
  final String botStatus;
  final String title;

  const TransactionHistoryContent(
      {required this.title,
      required this.summaries,
      required this.botStatus,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionHistoryTabScreen(header: _header(context), tabs: const [
      'Summary',
      'Activities'
    ], tabViews: [
      TransactionHistoryBotSummaryScreen(
        summaries: summaries,
      ),
      const TransactionHistoryBotActivitiesScreen(),
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
    BotStatus botStatusType = BotStatus.findByString(botStatus);
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
