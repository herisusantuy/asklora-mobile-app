import '../../../core/UtilTest/extensions.dart';
import 'chart_models.dart';

class BotRecommendationChartModel extends ChartDataSet {
  BotRecommendationChartModel.fromJson(Map<String, dynamic> json)
      : super(
            DateTime.parse(json['date']),
            checkDouble(json['price']),
            checkDouble(json['hedge_share']),
            checkDouble(json['current_pnl_ret']),
            index: json['i'] ?? 0);
}
