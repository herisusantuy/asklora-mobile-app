import 'dart:async';
import 'dart:convert';

import 'package:asklora_mobile_chart/main.dart';
import 'package:flutter/services.dart';

import '../../../core/domain/base_response.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import '../utils/bot_stock_utils.dart';

class BotStockRepository {
  Future<BaseResponse<List<ChartDataSet>>> fetchChartDataJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/aapl_with_index.json');

      Iterable iterable = json.decode(response);

      return BaseResponse.complete(List<ChartDataSet>.from(
          iterable.map((model) => ChartDataSet.fromJson(model))));
    } catch (e) {
      return BaseResponse.error('Something went wrong');
    }
  }

  Future<BaseResponse<List<RecommendedBot>>> fetchBotRecommendation() async {
    await Future.delayed(const Duration(seconds: 2));
    return BaseResponse.complete(defaultRecommendedBots);
  }

  Future<BaseResponse<List<RecommendedBot>>> fetchBotPortfolio() async {
    await Future.delayed(const Duration(seconds: 2));
    return BaseResponse.complete(defaultRecommendedBots);
  }

  Future<BaseResponse<bool>> getFreeBotStock() async {
    await Future.delayed(const Duration(seconds: 2));
    return BaseResponse.complete(true);
  }
}
