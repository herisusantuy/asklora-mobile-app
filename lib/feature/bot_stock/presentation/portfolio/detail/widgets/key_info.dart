part of '../bot_portfolio_detail_screen.dart';

class KeyInfo extends StatelessWidget {
  final RecommendedBot recommendedBot;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const KeyInfo({required this.recommendedBot, Key? key}) : super(key: key);

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
          const PairColumnText(
              title1: 'Investment Period',
              subTitle1: '2 weeks',
              title2: 'Time of Rollover',
              subTitle2: '0'),
          _spaceBetweenInfo,
          const PairColumnText(
              title1: 'Start Time',
              subTitle1: '03/12 15:30:00 ET',
              title2: 'End Time',
              subTitle2: '03/16 15:30:00 ET '),
          _spaceBetweenInfo,
          const PairColumnText(
              title1: 'Stop Loss Level (USD)',
              subTitle1: '240.00',
              title2: 'Take Profit Level (USD)',
              subTitle2: 'N/A'),
          _spaceBetweenInfo,
          ColumnText(
              title: 'Botstock Status',
              subTitle:
                  BotPortfolioStatus.findByString(recommendedBot.status ?? '')
                      .name),
          const SizedBox(
            height: 40,
          ),
          RoundColoredBox(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columnTextBigTitle(title: '+15%', subTitle: 'Avg. Return'),
                _columnTextBigTitle(title: '-10%', subTitle: 'Avg. Loss'),
                _columnTextBigTitle(
                    title: '27', subTitle: 'Avg. Period (Days)'),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextNew(
              '*Performance of Pullup TSLA in the past year',
              style: AskLoraTextStyles.body4
                  .copyWith(color: AskLoraColors.darkGray),
            ),
          ),
        ],
      );

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
