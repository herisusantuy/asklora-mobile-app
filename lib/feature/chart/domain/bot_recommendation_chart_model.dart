import '../../../core/utils/extensions.dart';
import 'chart_models.dart';

class BotRecommendationChartModel extends ChartDataSet {
  BotRecommendationChartModel.fromJson(Map<String, dynamic> json)
      : super(
            DateTime.parse(json['date']),
            checkDouble(json['price']),
            checkDouble(json['hedge_share'] ?? 0),
            checkDouble(json['pnl_amt'] ?? 0),
            index: json['i'] ?? 0);
}
