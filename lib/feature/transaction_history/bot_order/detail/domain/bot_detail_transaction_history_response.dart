import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../bot_stock/domain/bot_detail_model.dart';
import '../../../../chart/domain/bot_portfolio_chart_models.dart';
import 'bot_activities_transaction_history_model.dart';
import 'bot_summary_transaction_history_model.dart';

part 'bot_detail_transaction_history_response.g.dart';

@JsonSerializable()
class BotDetailTransactionHistoryResponse extends Equatable {
  final String uid;
  final String name;
  @JsonKey(name: 'bot_info')
  final BotInfo botInfo;
  final List<BotSummaryTransactionHistoryModel> summary;
  final List<BotActivitiesTransactionHistoryModel> activities;
  final List<BotPortfolioChartDataSet> performances;
  @JsonKey(name: 'investment_amount')
  final double investmentAmount;
  @JsonKey(name: 'final_return')
  final double? finalReturn;
  @JsonKey(name: 'total_pnl_pct')
  final double totalPnLPct;
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
  final int rolloverCount;
  @JsonKey(name: 'bot_stock_value')
  final double botStockValue;

  const BotDetailTransactionHistoryResponse(
      this.uid,
      this.name,
      this.botInfo,
      this.summary,
      this.activities,
      this.performances,
      this.investmentAmount,
      this.finalReturn,
      this.totalPnLPct,
      this.botDuration,
      this.spotDate,
      this.expireDate,
      this.daysToExpire,
      this.estMaxLoss,
      this.estMaxProfit,
      this.status,
      this.rolloverCount,
      this.botStockValue);

  BotDetailTransactionHistoryResponse copyWith(
          {List<BotActivitiesTransactionHistoryModel>? activities}) =>
      BotDetailTransactionHistoryResponse(
          uid,
          name,
          botInfo,
          summary,
          activities ?? this.activities,
          performances,
          investmentAmount,
          finalReturn,
          totalPnLPct,
          botDuration,
          spotDate,
          expireDate,
          daysToExpire,
          estMaxLoss,
          estMaxProfit,
          status,
          rolloverCount,
          botStockValue);

  String get rolloverCountString => rolloverCount.toString();

  String get botStockValueString {
    double botStockValueDouble = checkDouble(botStockValue);
    return (botStockValueDouble > 0)
        ? botStockValueDouble.convertToCurrencyDecimal()
        : '/';
  }

  String get estMaxProfitPctString {
    double targetProfitPctDouble = checkDouble(estMaxProfit);
    return (targetProfitPctDouble > 0)
        ? targetProfitPctDouble.convertToCurrencyDecimal(decimalDigits: 2)
        : '/';
  }

  String get estMaxLossPctString {
    double maxLossPctDouble = checkDouble(estMaxLoss).abs();
    return (maxLossPctDouble > 0)
        ? maxLossPctDouble.convertToCurrencyDecimal(decimalDigits: 2)
        : '/';
  }

  String get investmentAmountString {
    double investmentAmountDouble = checkDouble(investmentAmount);
    return (investmentAmountDouble > 0)
        ? investmentAmountDouble.convertToCurrencyDecimal()
        : 'NA';
  }

  String get totalPnLPctString {
    double totalPnlPctDouble = checkDouble(totalPnLPct);
    return (totalPnlPctDouble > 0)
        ? '+$totalPnlPctDouble%'
        : (totalPnlPctDouble < 0)
            ? '$totalPnlPctDouble%'
            : '/';
  }

  String get daysToExpireString => daysToExpire.abs().toInt().toString();

  String get spotDateFormatted => formatDateTimeAsString(spotDate);

  String get expireDateFormatted =>
      expireDate != null ? formatDateTimeAsString(expireDate) : 'NA';

  factory BotDetailTransactionHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BotDetailTransactionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BotDetailTransactionHistoryResponseToJson(this);

  @override
  List<Object?> get props => [
        uid,
        name,
        botInfo,
        summary,
        activities,
        performances,
        investmentAmount,
        finalReturn,
        totalPnLPct,
        botDuration,
        spotDate,
        expireDate,
        daysToExpire,
        estMaxLoss,
        estMaxProfit,
        status,
        rolloverCount,
        botStockValue,
        totalPnLPct
      ];
}
