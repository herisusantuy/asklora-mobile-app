import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../chart/domain/chart_models.dart';
import '../../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../utils/bot_stock_utils.dart';
import '../domain/portfolio_detail_response.dart';

class PortfolioRepository {
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

  Future<BaseResponse<List<RecommendedBot>>> fetchBotPortfolio(
      BotStockFilter botStockFilter) async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(
        botStockFilter == BotStockFilter.all ? defaultRecommendedBots : []);
  }

  Future<BaseResponse<PortfolioDetailResponse>> fetchPortfolioDetail() async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(PortfolioDetailResponse());
  }
}
