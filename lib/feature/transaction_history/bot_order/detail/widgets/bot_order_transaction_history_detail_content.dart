part of '../bot_order_transaction_history_detail_screen.dart';

class BotOrderTransactionHistoryDetailContent extends StatelessWidget {
  final String botStatus;
  final String title;
  late final BotStatus botStatusType;

  BotOrderTransactionHistoryDetailContent(
      {required this.title, required this.botStatus, Key? key})
      : super(key: key) {
    botStatusType = BotStatus.findByString(botStatus);
  }

  @override
  Widget build(BuildContext context) {
    return TransactionHistoryTabScreen(
      header: _header(context),
      tabs: getTabs(context),
      tabViews: getTabViews(context),
    );
  }

  List<String> getTabs(BuildContext context) {
    List<String> tabs = [
      S.of(context).summary,
      S.of(context).activities,

      ///TODO : SHOULD ONLY SHOW PERFORMANCE WHEN STATUS CLOSED LATER WHEN BOT STATUS IS FIXED
      S.of(context).performance
    ];
    if (botStatusType == BotStatus.closed) {
      tabs.add(S.of(context).performance);
    }
    return tabs;
  }

  List<Widget> getTabViews(BuildContext context) {
    List<Widget> tabViews = [
      BotOrderTransactionHistorySummaryScreen(botStatusType: botStatusType),
      const BotOrderTransactionHistoryActivitiesScreen(),

      ///TODO : SHOULD ONLY SHOW PERFORMANCE WHEN STATUS CLOSED LATER WHEN BOT STATUS IS FIXED
      const BotOrderTransactionHistoryPerformanceScreen()
    ];
    if (botStatusType == BotStatus.closed) {
      tabViews.add(const BotOrderTransactionHistoryPerformanceScreen());
    }
    return tabViews;
  }

  Widget _header(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          children: [
            Expanded(
                flex: 2,
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
                flex: 2,
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
