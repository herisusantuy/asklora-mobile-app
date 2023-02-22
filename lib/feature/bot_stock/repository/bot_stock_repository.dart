import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../core/domain/base_response.dart';
import '../../chart/domain/chart_models.dart';
import '../../chart/domain/chart_studio_animation_model.dart';
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

  Future<BaseResponse<ChartStudioAnimationModel>>
      fetchTradeChartDataJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/tesla_3_month_uno.json');
      var decodedJson = json.decode(response);
      return BaseResponse.complete(ChartStudioAnimationModel(
          chartData: _addIndexChartData(List<ChartDataStudioSet>.from(
              decodedJson['chart_data']
                  .map((model) => ChartDataStudioSet.fromJson(model)))),
          botData: List<ChartDataStudioSet>.from(decodedJson['bot_data']
              .map((model) => ChartDataStudioSet.fromJson(model))),
          uiData: List<UiData>.from(
              decodedJson['ui_data'].map((model) => UiData.fromJson(model)))));
    } catch (e) {
      return BaseResponse.error(e.toString());
    }
  }

  List<ChartDataStudioSet> _addIndexChartData(
      List<ChartDataStudioSet> chartData) {
    List<ChartDataStudioSet> finalChartData = [];
    int index = 0;
    for (var element in chartData) {
      finalChartData.add(ChartDataStudioSet(
          index: index++, date: element.date, price: element.price));
    }
    return finalChartData;
  }

  Future<BaseResponse<List<RecommendedBot>>> fetchBotRecommendation() async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(defaultRecommendedBots);
  }

  Future<BaseResponse<List<RecommendedBot>>> fetchFreeBotRecommendation(
      {bool isFreeBot = false}) async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(defaultFreeRecommendedBots);
  }

  Future<BaseResponse<List<RecommendedBot>>> fetchBotDemonstration() async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(demonstrationBots);
  }

  Future<BaseResponse<bool>> getFreeBotStock(
      {required RecommendedBot recommendedBot,
      required double tradeBotStockAmount}) async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(true);
  }

  Future<BaseResponse<bool>> rolloverBotStock(
      RecommendedBot recommendedBot) async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(true);
  }

  Future<BaseResponse<bool>> endBotStock(RecommendedBot recommendedBot) async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(true);
  }
}
