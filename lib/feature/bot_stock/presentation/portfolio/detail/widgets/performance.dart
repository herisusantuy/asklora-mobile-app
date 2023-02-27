part of '../bot_portfolio_detail_screen.dart';

class Performance extends StatelessWidget {
  final PortfolioBotDetailModel portfolioBotDetailModel;
  final PortfolioBotModel portfolioBotModel;
  final String _tempTooltipText =
      'Lorem ipsum dolor sit amet consectetur. Integer neque ultrices amet fermentum condimentum consequat. ';

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const Performance(
      {required this.portfolioBotDetailModel,
      required this.portfolioBotModel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextNew(
          'Performance',
          style: AskLoraTextStyles.h5,
        ),
        const SizedBox(
          height: 20,
        ),
        RoundColoredBox(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ColumnText(
                      title: 'Botstock Values (USD)',
                      subTitle:
                          portfolioBotModel.amount.convertToCurrencyDecimal())),
              Expanded(
                  child: ColumnText(
                      title: 'Inv. Amount (USD)',
                      subTitle:
                          portfolioBotModel.amount.convertToCurrencyDecimal())),
              const Expanded(
                  child: ColumnText(title: 'Total P/L', subTitle: '0%')),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PairColumnText(
            title1: 'Current Price',
            subTitle1: '230.00',
            title2: 'No. of Shares',
            subTitle2: '2',
            tooltipText2: _tempTooltipText),
        _spaceBetweenInfo,
        PairColumnText(
            title1: 'Stock Values (USD)',
            subTitle1: '500.00',
            title2: 'Cash (USD)',
            subTitle2: '600.00',
            tooltipText1: _tempTooltipText,
            tooltipText2: _tempTooltipText),
        _spaceBetweenInfo,
        const ColumnText(title: 'Ratio of Stock to Cash', subTitle: '5:6'),
        const SizedBox(
          height: 32,
        ),
        ChartAnimation(chartDataSets: portfolioBotDetailModel.performance.data),
      ]);
}
