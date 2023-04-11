import '../../../core/utils/extensions.dart';
import 'chart_models.dart';

class BotRecommendationChartModel extends ChartDataSet {
  BotRecommendationChartModel.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    index = json['i'] ?? 0;
    price = checkDouble(json['price']);
    hedgeShare = checkDouble(json['hedge_share']);
    currentPnlRet = checkDouble(json['current_pnl_ret']);
  }
}
