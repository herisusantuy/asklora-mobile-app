import 'dart:async';

import '../../../../../core/domain/base_response.dart';
import '../../../../../main.dart';
import '../../../../../mock/mock_data.dart';
import '../../../domain/bot_detail_request.dart';
import '../../../utils/bot_stock_utils.dart';
import '../domain/portfolio_api_client.dart';
import '../domain/portfolio_bot_detail_model.dart';
import '../domain/portfolio_bot_model.dart';
import '../domain/portfolio_response.dart';

class PortfolioRepository {
  final PortfolioApiClient _portfolioApiClient = PortfolioApiClient();

  Future<BaseResponse<List<PortfolioBotModel>>> fetchBotPortfolio(
      BotStockFilter botStockFilter) async {
    if (isDemoEnable) {
      await Future.delayed(const Duration(milliseconds: 500));

      ///MOCK
      var data = await MockData().fetchBotPortfolioResponse();
      return BaseResponse.complete(data.portfolioBots);
    } else {
      ///REAL
      await Future.delayed(const Duration(seconds: 1));
      return BaseResponse.complete(
          botStockFilter == BotStockFilter.all ? defaultPortfolioBot : []);
    }
  }

  Future<BaseResponse<PortfolioResponse>> fetchPortfolio() async {
    if (isDemoEnable) {
      ///MOCK
      await Future.delayed(const Duration(milliseconds: 500));
      return BaseResponse.complete(
          await MockData().fetchPortfolioDetailResponse());
    } else {
      ///REAL
      await Future.delayed(const Duration(seconds: 1));
      return BaseResponse.complete(PortfolioResponse());
    }
  }

  Future<BaseResponse<PortfolioBotDetailModel>> fetchBotPortfolioDetail(
      PortfolioBotModel portfolioBotModel) async {
    try {
      var response = await _portfolioApiClient.fetchPortfolioBotDetail(
          BotDetailRequest(portfolioBotModel.ticker, portfolioBotModel.botId));

      return BaseResponse.complete(
          PortfolioBotDetailModel.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error('Something went wrong');
    }
  }

  Future<BaseResponse<bool>> rolloverBotStock(
      PortfolioBotModel portfolioBotModel) async {
    await Future.delayed(const Duration(seconds: 1));
    return BaseResponse.complete(true);
  }

  Future<BaseResponse<bool>> endBotStock(
      PortfolioBotModel portfolioBotModel) async {
    if (isDemoEnable) {
      ///Remove bot to mock data
      await Future.delayed(const Duration(milliseconds: 500));
      MockData().endBotStock(portfolioBotModel);
      return BaseResponse.complete(true);
    } else {
      await Future.delayed(const Duration(seconds: 1));
      return BaseResponse.complete(true);
    }
  }
}
