import 'package:json_annotation/json_annotation.dart';
import '../../../../core/utils/extensions.dart';
import '../../../chart/domain/bot_portfolio_chart_models.dart';
import '../bot_detail_model.dart';

part 'bot_active_order_detail_model.g.dart';

@JsonSerializable()
class BotActiveOrderDetailModel {
  final String uid;
  final String name;
  @JsonKey(name: 'botstock_value')
  final double? botStockValue;
  @JsonKey(name: 'investment_amount')
  final double investmentAmount;
  @JsonKey(name: 'total_pnl_amt')
  final double totalPnLAmt;
  final List<BotPortfolioChartDataSet> performances;
  @JsonKey(name: 'bot_duration')
  final String botDuration;
  @JsonKey(name: 'spot_date')
  final String spotDate;
  @JsonKey(name: 'expire_date')
  final String? expireDate;
  @JsonKey(name: 'days_to_expire')
  final int daysToExpire;
  @JsonKey(name: 'est_max_loss')
  final double estMaxLoss;
  @JsonKey(name: 'est_max_profit')
  final double estMaxProfit;
  final String status;
  @JsonKey(name: 'rollover_count')
  final int? rolloverCount;
  @JsonKey(name: 'avg_return_pct')
  final double avgReturnPct;
  @JsonKey(name: 'avg_loss_pct')
  final double avgLossPct;
  @JsonKey(name: 'avg_period')
  final double avgPeriod;
  @JsonKey(name: 'bot_info')
  final BotInfo botInfo;
  @JsonKey(name: 'stock_info')
  final StockInfo stockInfo;

  ///todo : later menyesuaikan endpoint response
  @JsonKey(name: 'current_price')
  final double? currentPrice;
  @JsonKey(name: 'stock_value')
  final double stockValue;
  @JsonKey(name: 'bot_asset_in_stock_pct')
  final double botAssetInStockPct;
  @JsonKey(name: 'bot_cash_balance')
  final double botCashBalance;
  @JsonKey(name: 'bot_share')
  final double botShare;
  @JsonKey(name: 'max_loss_pct')
  final double maxLossPct;
  @JsonKey(name: 'target_profit_pct')
  final double targetProfitPct;

  const BotActiveOrderDetailModel(
      this.uid,
      this.name,
      this.botStockValue,
      this.investmentAmount,
      this.totalPnLAmt,
      this.performances,
      this.botDuration,
      this.spotDate,
      this.expireDate,
      this.daysToExpire,
      this.estMaxLoss,
      this.estMaxProfit,
      this.status,
      this.rolloverCount,
      this.avgReturnPct,
      this.avgLossPct,
      this.avgPeriod,
      this.botInfo,
      this.stockInfo,
      this.currentPrice,
      this.stockValue,
      this.botAssetInStockPct,
      this.botCashBalance,
      this.botShare,
      this.maxLossPct,
      this.targetProfitPct);

  BotActiveOrderDetailModel copyWith(
          {List<BotPortfolioChartDataSet>? performances}) =>
      BotActiveOrderDetailModel(
          uid,
          name,
          botStockValue,
          investmentAmount,
          totalPnLAmt,
          performances ?? this.performances,
          botDuration,
          spotDate,
          expireDate,
          daysToExpire,
          estMaxLoss,
          estMaxProfit,
          status,
          rolloverCount,
          avgReturnPct,
          avgLossPct,
          avgPeriod,
          botInfo,
          stockInfo,
          currentPrice,
          stockValue,
          botAssetInStockPct,
          botCashBalance,
          botShare,
          maxLossPct,
          targetProfitPct);

  String get rolloverCountString =>
      rolloverCount != null ? rolloverCount.toString() : 'NA';

  String get investmentAmountString {
    double investmentAmountDouble = checkDouble(investmentAmount);
    return (investmentAmountDouble > 0)
        ? investmentAmountDouble.convertToCurrencyDecimal()
        : 'NA';
  }

  String get currentPriceString {
    double currentPriceDouble = checkDouble(currentPrice);
    return (currentPriceDouble > 0)
        ? currentPriceDouble.convertToCurrencyDecimal()
        : 'NA';
  }

  String get stockValueString {
    double stockValueDouble = checkDouble(stockValue);
    return (stockValueDouble > 0)
        ? stockValueDouble.convertToCurrencyDecimal()
        : '/';
  }

  String get botAssetInStockPctString {
    double botAssetInStockPctDouble = checkDouble(botAssetInStockPct);
    return (botAssetInStockPctDouble > 0) ? '$botAssetInStockPctDouble%' : '/';
  }

  String get botCashBalanceString {
    double botCashBalanceDouble = checkDouble(botCashBalance);
    return (botCashBalanceDouble > 0)
        ? botCashBalanceDouble.convertToCurrencyDecimal()
        : 'NA';
  }

  String get botShareString {
    double botShareDouble = checkDouble(botShare);
    return (botShareDouble > 0) ? botShareDouble.toString() : '/';
  }

  String get botStockValueString {
    double botStockValueDouble = checkDouble(botStockValue);
    return (botStockValueDouble > 0)
        ? botStockValueDouble.convertToCurrencyDecimal()
        : '/';
  }

  String get totalPnlRetString {
    double totalPnlDouble = checkDouble(totalPnLAmt);
    return (totalPnlDouble > 0)
        ? '+$totalPnlDouble%'
        : (totalPnlDouble < 0)
            ? '$totalPnlDouble%'
            : '/';
  }

  String get avgReturnString {
    double avgReturnPctDouble = checkDouble(avgReturnPct);
    return (avgReturnPctDouble > 0) ? '+$avgReturnPctDouble%' : 'NA';
  }

  String get avgPeriodString {
    double avgPeriodDouble = checkDouble(avgPeriod);
    return (avgPeriodDouble > 0) ? '$avgPeriodDouble' : 'NA';
  }

  String get avgLossString {
    double avgLossPctDouble = checkDouble(avgLossPct);
    return (avgLossPctDouble > 0)
        ? '+$avgLossPctDouble%'
        : (avgLossPctDouble < 0)
            ? '$avgLossPctDouble%'
            : 'NA';
  }

  String get maxLossPctString =>
      maxLossPct.convertToCurrencyDecimal(decimalDigits: 2);

  String get targetProfitPctString =>
      targetProfitPct.convertToCurrencyDecimal(decimalDigits: 2);

  String get expireDateStr => expireDate ?? '';

  String get daysToExpireString => '${daysToExpire.abs()}';

  factory BotActiveOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BotActiveOrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotActiveOrderDetailModelToJson(this);
}
