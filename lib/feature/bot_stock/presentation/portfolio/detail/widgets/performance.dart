part of '../bot_portfolio_detail_screen.dart';

class Performance extends StatelessWidget {
  final PortfolioBotDetailModel? portfolioBotDetailModel;
  final PortfolioBotModel portfolioBotModel;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const Performance(
      {this.portfolioBotDetailModel, required this.portfolioBotModel, Key? key})
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
                      title: 'Botstock values (HKD)',
                      subTitle:
                          portfolioBotModel.amount.convertToCurrencyDecimal())),
              Expanded(
                  child: ColumnText(
                      title: 'Inv. Amount (HKD)',
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
            leftTitle: 'Current Price',
            leftSubTitle:
                '${portfolioBotDetailModel == null ? '-' : portfolioBotDetailModel?.price ?? '-'}',
            rightTitle: 'No. of Shares',
            rightSubTitle: '0',
            rightTooltipText:
                'Indicates how many shares of a company are currently owned by you.'),
        _spaceBetweenInfo,
        PairColumnText(
          leftTitle: 'Stock Values (HKD)',
          leftSubTitle: '0',
          rightTitle: 'Cash (HKD)',
          rightSubTitle: '${portfolioBotModel.amount}',
        ),
        _spaceBetweenInfo,
        const ColumnText(title: 'Ratio of Stock to Cash', subTitle: '0:1'),
        _chartWidget()
      ]);

  Widget _chartWidget() {
    return const SizedBox(
      height: 300,
      child: Align(
          alignment: Alignment.center,
          child: Text(
              'Performance data will be available once the Botstock starts')),
    );

    /// The chart data should be disabled in the SFC demo build.
    /*if (portfolioBotDetailModel?.performance != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child:
            ChartAnimation(chartDataSets: portfolioBotDetailModel?.performance),
      );
    } else {
      return const SizedBox(
        height: 300,
        child: Align(
            alignment: Alignment.center,
            child: Text('Performance data is not available for now')),
      );
    }*/
  }
}
