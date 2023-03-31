import 'package:json_annotation/json_annotation.dart';
import '../../../../core/utils/extensions.dart';
import '../bot_detail_model.dart';

part 'bot_active_order_detail_model.g.dart';

@JsonSerializable()
class BotActiveOrderDetailModel {
  final String pk;
  @JsonKey(name: 'bot_id')
  final String botId;
  @JsonKey(name: 'expire_date')
  final String expireDate;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final String status;
  @JsonKey(name: 'current_pnl_ret')
  final double? currentPnlRet;
  @JsonKey(name: 'current_price')
  final double currentPrice;
  @JsonKey(name: 'spot_date')
  final String spotDate;
  @JsonKey(name: 'investment_amount')
  final double? investmentAmount;
  @JsonKey(name: 'bot_share')
  final double? botShare;
  @JsonKey(name: 'bot_cash_balance')
  final double? botCashBalance;
  @JsonKey(name: 'max_loss_pct')
  final double maxLossPct;
  @JsonKey(name: 'target_profit_pct')
  final double targetProfitPct;
  @JsonKey(name: 'action_status')
  final String? actionStatus;

  ///this still need to wait for chart finalize
  // final List<ChartDataSet> performance;
  @JsonKey(name: 'rollover_count')
  final int rolloverCount;
  @JsonKey(name: 'avg_loss')
  final double? avgLoss;
  @JsonKey(name: 'avg_return')
  final double? avgReturn;
  @JsonKey(name: 'avg_period')
  final double? avgPeriod;
  @JsonKey(name: 'stock_value')
  final double? stockValue;
  @JsonKey(name: 'botstock_value')
  final double? botStockValue;
  @JsonKey(name: 'bot_detail')
  final BotModel botDetail;
  @JsonKey(name: 'ticker_detail')
  final TickerDetailModel tickerDetail;
  @JsonKey(name: 'asset_pct')
  final double botAssetInStockPct;
  @JsonKey(name: 'days_to_expire')
  final int daysToExpire;

  const BotActiveOrderDetailModel(
    this.pk,
    this.botId,
    this.expireDate,
    this.isActive,
    this.status,
    this.currentPnlRet,
    this.currentPrice,
    this.investmentAmount,
    this.botShare,
    this.botCashBalance,
    this.actionStatus,
    this.avgLoss,
    this.avgReturn,
    this.avgPeriod,
    this.stockValue,
    this.botStockValue,
    this.botDetail,
    this.tickerDetail, {
    // this.performance = const [],
    this.botAssetInStockPct = 0,
    this.spotDate = '',
    this.daysToExpire = 0,
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

  String get currentPnlRetString {
    double currentPnlRetDouble = checkDouble(currentPnlRet);
    return (currentPnlRetDouble > 0)
        ? '+$currentPnlRetDouble%'
        : (currentPnlRetDouble < 0)
            ? '$currentPnlRetDouble%'
            : '/';
  }

  String get avgReturnString {
    double avgReturnDouble = checkDouble(avgReturn);
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

  Map<String, dynamic> toJson() => _$BotActiveOrderDetailModelToJson(this);
}

@JsonSerializable()
class TickerDetailModel {
  final String description;
  final String symbol;
  final String ticker;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'chinese_name')
  final String chineseName;
  @JsonKey(name: 'traditional_name')
  final String traditionalName;
  final String sector;
  final String industry;
  final String ceo;
  final int employees;
  final String founded;
  final String headquarters;

  const TickerDetailModel(
      this.description,
      this.symbol,
      this.ticker,
      this.tickerName,
      this.chineseName,
      this.traditionalName,
      this.sector,
      this.industry,
      this.ceo,
      this.employees,
      this.founded,
      this.headquarters);

  factory TickerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TickerDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TickerDetailModelToJson(this);
}
