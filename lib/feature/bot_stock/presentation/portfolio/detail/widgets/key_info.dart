part of '../bot_portfolio_detail_screen.dart';

class KeyInfo extends StatelessWidget {
  final PortfolioBotModel portfolioBotModel;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const KeyInfo({required this.portfolioBotModel, Key? key}) : super(key: key);

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
              leftTitle: 'Investment Period',
              leftSubTitle: '2 weeks',
              rightTitle: 'Time of Rollover',
              rightSubTitle: '0'),
          _spaceBetweenInfo,
          const PairColumnText(
              leftTitle: 'Start Time',
              leftSubTitle: '03/12 15:30:00 ET',
              rightTitle: 'End Time',
              rightSubTitle: '03/16 15:30:00 ET '),
          _spaceBetweenInfo,
          const PairColumnText(
              leftTitle: 'Stop Loss Level (USD)',
              leftSubTitle: '240.00',
              rightTitle: 'Take Profit Level (USD)',
              rightSubTitle: 'N/A'),
          _spaceBetweenInfo,
          ColumnText(
              title: 'Botstock Status',
              subTitle: BotPortfolioStatus.findByString('active').name),
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
