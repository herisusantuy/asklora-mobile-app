import 'dart:convert';

import '../core/domain/base_response.dart';
import '../core/utils/storage/shared_preference.dart';
import '../feature/balance/deposit/utils/deposit_utils.dart';
import '../feature/balance/withdrawal/domain/withdrawal_response.dart';
import '../feature/bot_stock/domain/bot_recommendation_model.dart';
import '../feature/bot_stock/presentation/portfolio/domain/portfolio_bot_model.dart';
import '../feature/bot_stock/presentation/portfolio/domain/portfolio_bot_response.dart';
import '../feature/bot_stock/presentation/portfolio/domain/portfolio_response.dart';

class MockData {
  final _sharedPreference = SharedPreference();

  static MockData? _instance;

  factory MockData() => _instance ??= MockData._();

  MockData._();

  Future<void> _saveDepositType(DepositType depositType) async {
    _sharedPreference.writeData('deposit_type', depositType.name);
  }

  Future<DepositType> getDepositType() async {
    String? data = await _sharedPreference.readData('deposit_type');
    return DepositType.values.firstWhere((element) => element.name == data);
  }

  Future<PortfolioResponse> fetchPortfolioDetailResponse() async {
    String? response = await _sharedPreference.readData('portfolio_response');
    if (response != null) {
      return PortfolioResponse.fromJson(jsonDecode(response));
    } else {
      return PortfolioResponse(
          totalPortfolio: 0,
          withdrawableAmount: 0,
          buyingPower: 0,
          totalBotStockValues: 0,
          profit: 0);
    }
  }

  Future<void> _savePortfolioResponse(
      PortfolioResponse portfolioResponse) async {
    _sharedPreference.writeData(
        'portfolio_response', jsonEncode(portfolioResponse.toJson()));
  }

  Future<PortfolioBotResponse> fetchBotPortfolioResponse() async {
    String? response =
        await _sharedPreference.readData('portfolio_bot_response');
    if (response != null) {
      return PortfolioBotResponse.fromJson(jsonDecode(response));
    } else {
      return PortfolioBotResponse();
    }
  }

  Future<void> _savePortfolioBotResponse(
      PortfolioBotResponse portfolioBotResponse) async {
    _sharedPreference.writeData(
        'portfolio_bot_response', jsonEncode(portfolioBotResponse.toJson()));
  }

  void saveDeposit(double depositAmount) async {
    PortfolioResponse portfolioResponse = await fetchPortfolioDetailResponse();
    _saveDepositType(DepositType.type1);
    await _savePortfolioResponse(portfolioResponse.copyWith(
      totalPortfolio: portfolioResponse.totalPortfolio + depositAmount,
      withdrawableAmount: portfolioResponse.withdrawableAmount + depositAmount,
      buyingPower: portfolioResponse.buyingPower + depositAmount,
    ));
  }

  Future<BaseResponse<WithdrawalResponse>> saveWithdrawal(
      double withdrawalAmount) async {
    PortfolioResponse portfolioDetailResponse =
        await fetchPortfolioDetailResponse();
    if (withdrawalAmount <= portfolioDetailResponse.withdrawableAmount) {
      await _savePortfolioResponse(portfolioDetailResponse.copyWith(
        totalPortfolio:
            portfolioDetailResponse.totalPortfolio - withdrawalAmount,
        withdrawableAmount:
            portfolioDetailResponse.withdrawableAmount - withdrawalAmount,
        buyingPower: portfolioDetailResponse.buyingPower - withdrawalAmount,
      ));
      return BaseResponse.complete(const WithdrawalResponse('Success'));
    } else {
      return BaseResponse.error(message: 'Insufficient Balance');
    }
  }

  Future<BaseResponse<bool>> createOrder(
      {required BotRecommendationModel botRecommendationModel,
      required double tradeBotStockAmount,
      required String estimatedEndDate}) async {
    PortfolioResponse portfolioDetailResponse =
        await fetchPortfolioDetailResponse();
    if (botRecommendationModel.freeBot ||
        portfolioDetailResponse.buyingPower >= tradeBotStockAmount) {
      PortfolioBotResponse data = await fetchBotPortfolioResponse();
      List<PortfolioBotModel> portfolioBots = List.from(data.portfolioBots);
      portfolioBots.add(PortfolioBotModel(
          botRecommendationModel.id,
          botRecommendationModel.suitability,
          botRecommendationModel.benefit,
          botRecommendationModel.botId,
          botRecommendationModel.botWord,
          botRecommendationModel.botType,
          botRecommendationModel.botAppType,
          botRecommendationModel.ticker,
          botRecommendationModel.tickerName,
          botRecommendationModel.tickerSymbol,
          botRecommendationModel.latestPrice,
          tradeBotStockAmount,
          expiredDate: estimatedEndDate,
          freeBot: botRecommendationModel.freeBot));

      await _savePortfolioBotResponse(
          PortfolioBotResponse(portfolioBots: portfolioBots));
      await _savePortfolioResponse(portfolioDetailResponse.copyWith(
          withdrawableAmount: portfolioDetailResponse.withdrawableAmount -
              (botRecommendationModel.freeBot ? 0 : tradeBotStockAmount),
          buyingPower: portfolioDetailResponse.buyingPower -
              (botRecommendationModel.freeBot ? 0 : tradeBotStockAmount),
          totalBotStockValues: portfolioDetailResponse.totalBotStockValues +
              (botRecommendationModel.freeBot ? 0 : tradeBotStockAmount),
          totalPortfolio: portfolioDetailResponse.totalPortfolio));
      return BaseResponse.complete(true);
    } else {
      return BaseResponse.error(message: 'Insufficient balance');
    }
  }

  void endBotStock(PortfolioBotModel portfolioBotModel) async {
    PortfolioBotResponse data = await fetchBotPortfolioResponse();
    List<PortfolioBotModel> portfolioBots = List.from(data.portfolioBots);
    portfolioBots.remove(portfolioBotModel);
    await _savePortfolioBotResponse(
        PortfolioBotResponse(portfolioBots: portfolioBots));

    PortfolioResponse portfolioResponse = await fetchPortfolioDetailResponse();
    await _savePortfolioResponse(portfolioResponse.copyWith(
      buyingPower: portfolioResponse.buyingPower + portfolioBotModel.amount,
      withdrawableAmount:
          portfolioResponse.withdrawableAmount + portfolioBotModel.amount,
      totalBotStockValues:
          portfolioResponse.totalBotStockValues - portfolioBotModel.amount,
    ));
  }
}
