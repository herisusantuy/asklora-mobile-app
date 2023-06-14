import 'package:json_annotation/json_annotation.dart';
import '../../../../core/domain/bot/bot_detail_model.dart';
import '../../../../core/domain/bot/bot_info.dart';
import '../../../../core/domain/bot/stock_info.dart';
import '../../../../core/utils/extensions.dart';

part 'bot_active_order_detail_model.g.dart';

@JsonSerializable()
class BotActiveOrderDetailModel extends BotDetailModel {
  @JsonKey(name: 'total_pnl_amt')
  final double totalPnLAmt;
  @JsonKey(name: 'days_to_expire')
  final int daysToExpire;
  @JsonKey(name: 'avg_return_pct')
  final double avgReturnPct;
  @JsonKey(name: 'avg_loss_pct')
  final double avgLossPct;
  @JsonKey(name: 'avg_period')
  final double avgPeriod;
  @JsonKey(name: 'stock_info')
  final StockInfo stockInfo;
  @JsonKey(name: 'current_price')
  final double? currentPrice;
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
      String uid,
      String name,
      BotInfo botInfo,
      double investmentAmount,
      double? finalReturn,
      String botDuration,
      String spotDate,
      String? expireDate,
      double estMaxLoss,
      double estMaxProfit,
      String status,
      int rolloverCount,
      double botStockValue,
      this.totalPnLAmt,
      this.daysToExpire,
      this.avgReturnPct,
      this.avgLossPct,
      this.avgPeriod,
      this.stockInfo,
      this.currentPrice,
      this.botAssetInStockPct,
      this.botCashBalance,
      this.botShare,
      this.maxLossPct,
      this.targetProfitPct)
      : super(
          uid,
          name,
          botInfo,
          investmentAmount,
          finalReturn,
          botDuration,
          spotDate,
          expireDate,
          estMaxLoss,
          estMaxProfit,
          status,
          rolloverCount,
          botStockValue,
        );

  String get currentPriceString {
    final double currentPriceDouble = checkDouble(currentPrice);
    return (currentPriceDouble > 0)
        ? currentPriceDouble.convertToCurrencyDecimal()
        : 'NA';
  }

  String get botAssetInStockPctString {
    final double botAssetInStockPctDouble = checkDouble(botAssetInStockPct);
    return (botAssetInStockPctDouble > 0) ? '$botAssetInStockPctDouble%' : '/';
  }

  String get botCashBalanceString {
    final double botCashBalanceDouble = checkDouble(botCashBalance);
    return (botCashBalanceDouble > 0)
        ? botCashBalanceDouble.convertToCurrencyDecimal()
        : 'NA';
  }

  String get botShareString {
    final double botShareDouble = checkDouble(botShare);
    return (botShareDouble > 0) ? botShareDouble.toString() : '/';
  }

  String get totalPnlRetString {
    final double totalPnlDouble = checkDouble(totalPnLAmt);
    return (totalPnlDouble > 0)
        ? '+$totalPnlDouble%'
        : (totalPnlDouble < 0)
            ? '$totalPnlDouble%'
            : '/';
  }

  String get avgReturnString {
    final double avgReturnPctDouble = checkDouble(avgReturnPct);
    return (avgReturnPctDouble > 0) ? '+$avgReturnPctDouble%' : 'NA';
  }

  String get avgPeriodString {
    final double avgPeriodDouble = checkDouble(avgPeriod);
    return (avgPeriodDouble > 0) ? '$avgPeriodDouble' : 'NA';
  }

  String get avgLossString {
    final double avgLossPctDouble = checkDouble(avgLossPct);
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

  String get daysToExpireString => '${daysToExpire.abs()}';

  factory BotActiveOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BotActiveOrderDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BotActiveOrderDetailModelToJson(this);
}
