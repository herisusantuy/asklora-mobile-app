import '../../../core/utils/date_utils.dart';
import '../../../core/utils/extensions.dart';
import 'chart_models.dart';

class BotPortfolioChartDataSet extends ChartDataSet {
  const BotPortfolioChartDataSet(
    super.date,
    super.price,
    super.hedgeShare,
    super.currentPnlRet, {
    super.index,
  });

  BotPortfolioChartDataSet.fromJson(Map<String, dynamic> json)
      : super(
          DateTime.parse(formatDateTimeAsString(json['created'])),
          checkDouble(json['prices']),
          checkDouble(json['filled_qty']),
          checkDouble(json['pnl_ret']),
          index: json['i'] ?? 0,
        );

  BotPortfolioChartDataSet copyWith({int? index}) => BotPortfolioChartDataSet(
        date,
        price,
        hedgeShare,
        currentPnlRet,
        index: index ?? this.index,
      );
}
