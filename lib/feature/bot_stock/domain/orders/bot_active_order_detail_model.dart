import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/extensions.dart';
import '../../../chart/domain/chart_models.dart';
import 'bot_active_order_model.dart';

part 'bot_active_order_detail_model.g.dart';

@JsonSerializable()
class BotActiveOrderDetailModel extends BotActiveOrderModel {
  @JsonKey(name: 'spot_date')
  final String spotDate;
  @JsonKey(name: 'investment_amount')
  final String? investmentAmount;
  @JsonKey(name: 'bot_share')
  final String? botShare;
  @JsonKey(name: 'bot_cash_balance')
  final String? botCashBalance;
  @JsonKey(name: 'max_loss_pct')
  final double maxLossPct;
  @JsonKey(name: 'target_profit_pct')
  final double targetProfitPct;
  @JsonKey(name: 'action_status')
  final String? actionStatus;
  final List<ChartDataSet> performance;
  @JsonKey(name: 'rollover_count')
  final double rolloverCount;
  @JsonKey(name: 'avg_loss')
  final double? avgLoss;
  @JsonKey(name: 'avg_ret')
  final double? avgRet;
  @JsonKey(name: 'avg_period')
  final double? avgPeriod;
  @JsonKey(name: 'stock_value')
  final double? stockValue;
  @JsonKey(name: 'stock_cash_ratio')
  final String? stockCashRatio;

  ///below variable isn't available yet on endpoint
  final double? botStockValue;
  @JsonKey(name: 'bot_asset_in_stock_pct')
  final double botAssetInStockPct;
  final String investmentPeriod;
  final String dayTillExpiry;

  const BotActiveOrderDetailModel(
    super.pk,
    super.botId,
    super.expireDate,
    super.isActive,
    super.ticker,
    super.tickerName,
    super.status,
    super.currentPnlRet,
    super.currentPrice,
    this.investmentAmount,
    this.botShare,
    this.botCashBalance,
    this.actionStatus,
    this.avgLoss,
    this.avgRet,
    this.avgPeriod,
    this.stockValue,
    this.stockCashRatio,
    this.botStockValue, {
    this.performance = const [],
    this.botAssetInStockPct = 0,
    this.investmentPeriod = '',
    this.spotDate = '',
    this.dayTillExpiry = '',
    this.maxLossPct = 0,
    this.targetProfitPct = 0,
    this.rolloverCount = 0,
  });

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
        : 'NA';
  }

  String get avgReturnString {
    double avgReturnDouble = checkDouble(avgRet);
    return (avgReturnDouble > 0) ? '+$avgReturnDouble%' : 'NA';
  }

  String get avgPeriodString {
    double avgPeriodString = checkDouble(avgPeriod);
    return (avgPeriodString > 0) ? '$avgPeriodString' : 'NA';
  }

  String get avgLossString {
    double avgLossDouble = checkDouble(avgLoss);
    return (avgLossDouble > 0)
        ? '+$avgLossDouble%'
        : (avgLossDouble < 0)
            ? '$avgLossDouble%'
            : 'NA';
  }

  factory BotActiveOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BotActiveOrderDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BotActiveOrderDetailModelToJson(this);
}
