import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/utils/storage/shared_preference.dart';
import '../../../core/utils/storage/storage_keys.dart';
import '../../../main.dart';
import '../../../mock/mock_data.dart';
import '../../chart/domain/chart_models.dart';
import '../../chart/domain/chart_studio_animation_model.dart';
import '../domain/bot_detail_model.dart';
import '../domain/bot_detail_request.dart';
import '../domain/bot_recommendation_model.dart';
import '../domain/bot_recommendation_response.dart';
import '../domain/bot_stock_api_client.dart';
import '../utils/bot_stock_utils.dart';

class BotStockRepository {
  final SharedPreference _sharedPreference = SharedPreference();
  final BotStockApiClient _botStockApiClient = BotStockApiClient();

  Future<BaseResponse<BotDetailModel>> fetchBotDetail(
      String ticker, String botId) async {
    try {
      var response = await _botStockApiClient
          .fetchBotDetail(BotDetailRequest(ticker, botId));

      return BaseResponse.complete(BotDetailModel.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<List<ChartDataSet>>> fetchChartDataJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/aapl_with_index.json');

      Iterable iterable = json.decode(response);

      return BaseResponse.complete(List<ChartDataSet>.from(
          iterable.map((model) => ChartDataSet.fromJson(model))));
    } catch (e) {
      return BaseResponse.error();
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
      return BaseResponse.error(message: e.toString());
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

  Future<BaseResponse<List<BotRecommendationModel>>>
      fetchBotRecommendation() async {
    try {
      var response = await _botStockApiClient.fetchBotRecommendation(
          await _sharedPreference.readData(sfKeyPpiAccountId) ?? '');
      return BaseResponse.complete(
          BotRecommendationResponse.fromJson(response.data).data);
    } catch (e) {
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<List<BotRecommendationModel>>> fetchFreeBotRecommendation(
      {bool isFreeBot = false}) async {
    try {
      var response = await _botStockApiClient.fetchBotRecommendation(
          await _sharedPreference.readData(sfKeyPpiAccountId) ?? '');
      return BaseResponse.complete(List<BotRecommendationModel>.from(
          BotRecommendationResponse.fromJson(response.data)
              .data
              .map((model) => model.copyWith(freeBot: true))));
    } catch (e) {
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<List<BotRecommendationModel>>>
      fetchBotDemonstration() async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(demonstrationBots);
  }

  Future<BaseResponse<bool>> tradeBotStock(
      {required BotRecommendationModel botRecommendationModel,
      required double tradeBotStockAmount}) async {
    await removeInvestmentStyleState();
    if (isDemoEnable) {
      ///MOCK
      await Future.delayed(const Duration(milliseconds: 500));
      var data = await MockData().saveBotStock(
          botRecommendationModel: botRecommendationModel,
          tradeBotStockAmount: tradeBotStockAmount);
      return data;
    } else {
      ///REAL
      await Future.delayed(const Duration(milliseconds: 500));
      return BaseResponse.complete(true);
    }
  }

  Future<bool> removeInvestmentStyleState() async {
    _sharedPreference.deleteData('investment_style_state');
    return true;
  }
}
