import '../../../core/utils/date_utils.dart';
import '../../../core/utils/extensions.dart';
import 'chart_models.dart';

class BotPortfolioChartDataSet extends ChartDataSet {
  BotPortfolioChartDataSet(
      {super.index,
      super.date,
      super.price,
      super.hedgeShare,
      super.currentPnlRet});

  BotPortfolioChartDataSet.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(formatDateTimeAsString(json['created']));
    index = json['i'] ?? 0;
    price = checkDouble(json['prices']);
    hedgeShare = checkDouble(json['filled_qty']);
    currentPnlRet = checkDouble(json['pnl_ret']);
  }
}
