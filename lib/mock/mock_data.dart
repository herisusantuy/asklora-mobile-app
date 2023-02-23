import 'dart:convert';

import '../core/domain/base_response.dart';
import '../core/utils/storage/shared_preference.dart';
import '../feature/balance/deposit/utils/deposit_utils.dart';
import '../feature/balance/withdrawal/domain/withdrawal_response.dart';
import '../feature/bot_stock/presentation/portfolio/domain/portfolio_detail_response.dart';
import '../feature/bot_stock/presentation/portfolio/domain/portfolio_response.dart';
import '../feature/onboarding/ppi/domain/ppi_user_response.dart';

class MockData {
  final _sharedPreference = SharedPreference();

  static MockData? _instance;

  factory MockData() => _instance ??= MockData._();

  MockData._();

  DepositType depositType = DepositType.firstTime;

  ///CURRENT PORTFOLIO INC. TOTAL PORTFOLIO, WITHRAWABLE, ETC
  // PortfolioDetailResponse portfolioDetailResponse = PortfolioDetailResponse(
  //     totalPortfolio: 0,
  //     withdrawableAmount: 0,
  //     buyingPower: 0,
  //     totalBotStockValues: 0,
  //     profit: 0);

  ///CURRENT PORTFOLIO BOT OWNED BY USER
  // List<RecommendedBot> portfolioBots = [];

  Future<PortfolioDetailResponse> fetchPortfolioDetailResponse() async {
    String? response =
        await _sharedPreference.readData('portfolio_detail_response');
    if (response != null) {
      return PortfolioDetailResponse.fromJson(jsonDecode(response));
    } else {
      return PortfolioDetailResponse(
          totalPortfolio: 0,
          withdrawableAmount: 0,
          buyingPower: 0,
          totalBotStockValues: 0,
          profit: 0);
    }
  }

  Future<void> _savePortfolioDetailResponse(
      PortfolioDetailResponse portfolioDetailResponse) async {
    _sharedPreference.writeData('portfolio_detail_response',
        jsonEncode(portfolioDetailResponse.toJson()));
  }

  Future<PortfolioResponse> fetchPortfolioResponse() async {
    String? response = await _sharedPreference.readData('portfolio_response');
    if (response != null) {
      return PortfolioResponse.fromJson(jsonDecode(response));
    } else {
      return PortfolioResponse();
    }
  }

  Future<void> _savePortfolioResponse(
      PortfolioResponse portfolioResponse) async {
    _sharedPreference.writeData(
        'portfolio_response', jsonEncode(portfolioResponse.toJson()));
  }

  void saveDeposit(double depositAmount) async {
    PortfolioDetailResponse portfolioDetailResponse =
        await fetchPortfolioDetailResponse();

    _sharedPreference.writeData('deposit_type', DepositType.type1.name);
    await _savePortfolioDetailResponse(portfolioDetailResponse.copyWith(
      totalPortfolio: portfolioDetailResponse.totalPortfolio + depositAmount,
      withdrawableAmount:
          portfolioDetailResponse.withdrawableAmount + depositAmount,
      buyingPower: portfolioDetailResponse.buyingPower + depositAmount,
    ));
  }

  Future<BaseResponse<WithdrawalResponse>> saveWithdrawal(
      double withdrawalAmount) async {
    PortfolioDetailResponse portfolioDetailResponse =
        await fetchPortfolioDetailResponse();
    if (withdrawalAmount <= portfolioDetailResponse.withdrawableAmount) {
      await _savePortfolioDetailResponse(portfolioDetailResponse.copyWith(
        totalPortfolio:
            portfolioDetailResponse.totalPortfolio - withdrawalAmount,
        withdrawableAmount:
            portfolioDetailResponse.withdrawableAmount - withdrawalAmount,
        buyingPower: portfolioDetailResponse.buyingPower - withdrawalAmount,
      ));
      return BaseResponse.complete(const WithdrawalResponse('Success'));
    } else {
      return BaseResponse.error('Insufficient Balance');
    }
  }

  Future<BaseResponse<bool>> saveBotStock(
      {required RecommendedBot recommendedBot,
      required double tradeBotStockAmount}) async {
    PortfolioDetailResponse portfolioDetailResponse =
        await fetchPortfolioDetailResponse();
    if (recommendedBot.freeBot ||
        portfolioDetailResponse.buyingPower >= tradeBotStockAmount) {
      PortfolioResponse data = await fetchPortfolioResponse();
      List<RecommendedBot> portfolioBots = List.from(data.portfolioBots);
      //portfolioBots.add(recommendedBot.copyWith(amount: tradeBotStockAmount));

      await _savePortfolioResponse(
          PortfolioResponse(portfolioBots: portfolioBots));
      await _savePortfolioDetailResponse(portfolioDetailResponse.copyWith(
          withdrawableAmount: portfolioDetailResponse.withdrawableAmount -
              (recommendedBot.freeBot ? 0 : tradeBotStockAmount),
          buyingPower: portfolioDetailResponse.buyingPower -
              (recommendedBot.freeBot ? 0 : tradeBotStockAmount),
          totalBotStockValues:
              portfolioDetailResponse.totalBotStockValues + tradeBotStockAmount,
          totalPortfolio: portfolioDetailResponse.totalPortfolio +
              (recommendedBot.freeBot ? tradeBotStockAmount : 0)));
      return BaseResponse.complete(true);
    } else {
      return BaseResponse.error('Insufficient balance');
    }
  }

  void endBotStock(RecommendedBot recommendedBot) async {
    PortfolioResponse data = await fetchPortfolioResponse();
    List<RecommendedBot> portfolioBots = List.from(data.portfolioBots);
    print('portfolio bots ${portfolioBots}');
    portfolioBots.remove(recommendedBot);
    await _savePortfolioResponse(
        PortfolioResponse(portfolioBots: portfolioBots));

    PortfolioDetailResponse portfolioDetailResponse =
        await fetchPortfolioDetailResponse();
    await _savePortfolioDetailResponse(portfolioDetailResponse.copyWith(
      buyingPower: portfolioDetailResponse.buyingPower + recommendedBot.amount,
      withdrawableAmount:
          portfolioDetailResponse.withdrawableAmount + recommendedBot.amount,
      totalBotStockValues:
          portfolioDetailResponse.totalBotStockValues - recommendedBot.amount,
    ));
  }
}
