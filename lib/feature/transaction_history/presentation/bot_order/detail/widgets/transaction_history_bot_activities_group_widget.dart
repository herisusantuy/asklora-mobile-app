part of '../bot_transaction_history_detail_screen.dart';

class TransactionHistoryBotActivitiesGroupWidget extends StatelessWidget {
  final String title;
  final List<BotActivitiesTransactionModel> data;
  final bool showBottomBorder;

  const TransactionHistoryBotActivitiesGroupWidget(
      {required this.title,
      required this.data,
      required this.showBottomBorder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: showBottomBorder
                  ? const BorderSide(color: AskLoraColors.gray, width: 0.5)
                  : BorderSide.none)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TransactionHistoryGroupTitle(
            title: title,
          ),
          ...data
              .map(
                (e) => TransactionHistoryBotActivitiesCard(
                  botActivitiesTransactionModel: e,
                  showBottomBorder: data.indexOf(e) != data.length - 1,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
