import 'dart:async';
import 'dart:convert';

import 'package:asklora_mobile_chart/main.dart';
import 'package:asklora_mobile_chart/model/triplet.dart';
import 'package:asklora_mobile_chart/model/ui_data.dart';
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

  Future<
      BaseResponse<
          Triplet<List<ChartDataStudioSet>, List<ChartDataStudioSet>,
              List<UiData>>>> fetchTradeChartDataJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/tesla_3_month_uno.json');
      var decodedJson = json.decode(response);
      return BaseResponse.complete(Triplet(
          _addIndexChartData(List<ChartDataStudioSet>.from(
              decodedJson['chart_data']
                  .map((model) => ChartDataStudioSet.fromJson(model)))),
          List<ChartDataStudioSet>.from(decodedJson['bot_data']
              .map((model) => ChartDataStudioSet.fromJson(model))),
          List<UiData>.from(
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

  Future<BaseResponse<List<RecommendedBot>>> fetchBotDemonstration() async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(demonstrationBots);
  }

  Future<BaseResponse<List<RecommendedBot>>> fetchBotPortfolio() async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(defaultRecommendedBots);
  }

  Future<BaseResponse<bool>> getFreeBotStock() async {
    await Future.delayed(const Duration(seconds: 2));
    return BaseResponse.complete(true);
  }
}
