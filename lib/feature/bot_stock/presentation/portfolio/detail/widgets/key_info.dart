part of '../bot_portfolio_detail_screen.dart';

class KeyInfo extends StatelessWidget {
  final BotActiveOrderDetailModel botActiveOrderDetailModel;
  final BotStatus botStatus;
  final BotType botType;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const KeyInfo(
      {required this.botActiveOrderDetailModel,
      required this.botStatus,
      required this.botType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            'Key Info',
            style: AskLoraTextStyles.h5,
          ),
          const SizedBox(
            height: 20,
          ),
          PairColumnText(
              leftTitle: 'Investment Period',
              leftSubTitle: botActiveOrderDetailModel.botDetail.duration,
              rightTitle: 'Days Till Expiry',
              rightSubTitle: botActiveOrderDetailModel.daysToExpire.toString()),
          _spaceBetweenInfo,
          PairColumnText(
              leftTitle: 'Start Time',
              leftSubTitle: botActiveOrderDetailModel.spotDate,
              rightTitle: 'End Time',
              rightSubTitle: botActiveOrderDetailModel.expireDate),
          _spaceBetweenInfo,
          ..._stopLossMaxProfit(),
          _spaceBetweenInfo,
          PairColumnText(
              leftTitle: 'Botstock Status',
              leftSubTitle: botStatus.name,
              rightTitle: 'Number of Rollovers',
              rightSubTitle:
                  botActiveOrderDetailModel.rolloverCount.toString()),
          const SizedBox(
            height: 40,
          ),
          RoundColoredBox(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columnTextBigTitle(
                    title: botActiveOrderDetailModel.avgReturnString,
                    subTitle: 'Avg. Return'),
                _columnTextBigTitle(
                    title: botActiveOrderDetailModel.avgLossString,
                    subTitle: 'Avg. Loss'),
                _columnTextBigTitle(
                    title: botActiveOrderDetailModel.avgPeriodString,
                    subTitle: 'Avg. Period (Days)'),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      );

  List<Widget> _stopLossMaxProfit() => [
        PairColumnText(
          leftTitle:
              botType == BotType.plank ? 'Est. Stop Loss %' : 'Est. Max Loss %',
          leftSubTitle: botActiveOrderDetailModel.maxLossPct.toString(),
          rightTitle: botType == BotType.plank
              ? 'Est. Take Profit %'
              : 'Est. Max Profit %',
          rightSubTitle: botActiveOrderDetailModel.targetProfitPct.toString(),
        ),
      ];

  Widget _columnTextBigTitle(
          {required String title, required String subTitle}) =>
      Column(
        children: [
          CustomTextNew(
            title,
            style: AskLoraTextStyles.h4.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextNew(
            subTitle,
            style:
                AskLoraTextStyles.body3.copyWith(color: AskLoraColors.charcoal),
          ),
        ],
      );
}
