import 'dart:convert';

import '../core/domain/base_response.dart';
import '../core/utils/storage/shared_preference.dart';
import '../feature/balance/deposit/utils/deposit_utils.dart';
import '../feature/balance/withdrawal/domain/withdrawal_response.dart';
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

}
