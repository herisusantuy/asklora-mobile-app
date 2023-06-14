part of '../bot_order_transaction_history_detail_screen.dart';

class BotOrderTransactionHistoryActivitiesCard extends StatelessWidget {
  final BotActivitiesTransactionHistoryModel botActivitiesTransactionModel;
  final bool showBottomBorder;

  const BotOrderTransactionHistoryActivitiesCard(
      {required this.botActivitiesTransactionModel,
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
                  botActivitiesTransactionModel.side.capitalize(),
                  style: AskLoraTextStyles.h6,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              CustomTextNew(
                botActivitiesTransactionModel.investedString,
                style: AskLoraTextStyles.subtitle2,
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextNew(
              'HKD: 3,180.92*',
              style: AskLoraTextStyles.body3
                  .copyWith(color: AskLoraColors.darkGray),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextNew(
                botActivitiesTransactionModel.dateFormattedString,
                style: AskLoraTextStyles.body2
                    .copyWith(color: AskLoraColors.darkGray),
              ),
              Flexible(
                child: CustomTextNew(
                  '${S.of(context).filledPrice} : ${botActivitiesTransactionModel.filledAvgPriceString}  ${S.of(context).shares} : ${botActivitiesTransactionModel.filledQtyString}',
                  style: AskLoraTextStyles.body2
                      .copyWith(color: AskLoraColors.darkGray),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
