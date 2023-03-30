import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/feature_flags.dart';
import '../../../core/utils/storage/shared_preference.dart';
import '../../../core/utils/storage/storage_keys.dart';
import '../../../mock/mock_data.dart';
import '../../chart/domain/chart_models.dart';
import '../../chart/domain/chart_studio_animation_model.dart';
import '../domain/bot_detail_model.dart';
import '../domain/bot_detail_request.dart';
import '../domain/bot_recommendation_model.dart';
import '../domain/bot_recommendation_response.dart';
import '../domain/bot_stock_api_client.dart';
import '../domain/orders/bot_active_order_detail_model.dart';
import '../domain/orders/bot_active_order_model.dart';
import '../domain/orders/bot_create_order_request.dart';
import '../domain/orders/bot_create_order_response.dart';
import '../domain/orders/bot_order_request.dart';
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
      return BaseResponse.error();
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

  Future<bool> removeInvestmentStyleState() async {
    _sharedPreference.deleteData('investment_style_state');
    return true;
  }

  Future<BaseResponse<List<BotActiveOrderModel>>> activeOrders() async {
    if (FeatureFlags.isDemoEnable) {
      await Future.delayed(const Duration(milliseconds: 500));

      ///MOCK
      // var data = await MockData().fetchBotPortfolioResponse();
      // return BaseResponse.complete(data.portfolioBots);
      return BaseResponse.complete([]);
    } else {
      ///REAL
      var response = await _botStockApiClient.activeOrder();
      return BaseResponse.complete(List.from(response.data
          .map((element) => BotActiveOrderModel.fromJson(element))));
    }
  }

  Future<BaseResponse<BotActiveOrderDetailModel>> activeOrderDetail(String orderId) async {
    try{
      var response = await _botStockApiClient.activeOrderDetail(orderId);
      return BaseResponse.complete(BotActiveOrderDetailModel.fromJson(response.data));
    }
    catch(_){
      return BaseResponse.error();
    }
  }

  Future<BaseResponse<BotCreateOrderResponse>> createOrder(
      {required BotRecommendationModel botRecommendationModel,
      required double tradeBotStockAmount,
      required String estimatedEndDate}) async {
    if (FeatureFlags.isDemoEnable) {
      ///MOCK
      await Future.delayed(const Duration(milliseconds: 500));
      var data = await MockData().createOrder(
          estimatedEndDate: estimatedEndDate,
          botRecommendationModel: botRecommendationModel,
          tradeBotStockAmount: tradeBotStockAmount);
      await removeInvestmentStyleState();
      return data;
    } else {
      ///REAL
      try {
        var response = await _botStockApiClient.createOrder(
            BotCreateOrderRequest(
                ticker: botRecommendationModel.ticker,
                botId: botRecommendationModel.botId,
                spotDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                investmentAmount: tradeBotStockAmount,
                price: checkDouble(botRecommendationModel.latestPrice)));
        await removeInvestmentStyleState();
        return BaseResponse.complete(
            BotCreateOrderResponse.fromJson(response.data));
      } catch (e) {
        return BaseResponse.error();
      }
    }
  }

  Future<BaseResponse<bool>> cancelOrder(String orderId) async {
    if (FeatureFlags.isDemoEnable) {
      await Future.delayed(const Duration(milliseconds: 500));

      ///todo create mock using latest model
      //MockData().endBotStock(portfolioBotModel);
      return BaseResponse.complete(true);
    } else {
      try {
        await _botStockApiClient.cancelOrder(BotOrderRequest(orderId: orderId));
        return BaseResponse.complete(true);
      } catch (e) {
        return BaseResponse.error();
      }
    }
  }

  Future<BaseResponse<bool>> rolloverOrder(String orderId) async {
    if (FeatureFlags.isDemoEnable) {
      await Future.delayed(const Duration(milliseconds: 500));

      ///create mock rollover
      return BaseResponse.complete(true);
    } else {
      try {
        await _botStockApiClient
            .rolloverOrder(BotOrderRequest(orderId: orderId));
        return BaseResponse.complete(true);
      } catch (e) {
        return BaseResponse.error();
      }
    }
  }

  Future<BaseResponse<bool>> terminateOrder(String orderId) async {
    if (FeatureFlags.isDemoEnable) {
      await Future.delayed(const Duration(milliseconds: 500));

      ///create mock rollover
      return BaseResponse.complete(true);
    } else {
      try {
        await _botStockApiClient
            .terminateOrder(BotOrderRequest(orderId: orderId));
        return BaseResponse.complete(true);
      } catch (e) {
        return BaseResponse.error();
      }
    }
  }
}
