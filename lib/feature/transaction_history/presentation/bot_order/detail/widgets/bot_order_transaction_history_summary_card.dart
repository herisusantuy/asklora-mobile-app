part of '../bot_transaction_history_detail_screen.dart';

class BotOrderTransactionHistorySummaryCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showBottomBorder;

  const BotOrderTransactionHistorySummaryCard(
      {required this.title,
      required this.subTitle,
      required this.showBottomBorder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: CustomTextNew(
                  title,
                  style: AskLoraTextStyles.subtitle2,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              CustomTextNew(
                subTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
