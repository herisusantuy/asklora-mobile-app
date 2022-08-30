part of '../order_screen.dart';

class MarketPriceWidget extends StatelessWidget {
  final SymbolDetail symbolDetail;

  const MarketPriceWidget(this.symbolDetail,
      {Key key = const Key('market_price_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Market price of ${symbolDetail.name}',
        text: symbolDetail.marketPrice, fontType: FontType.smallText);
  }
}
