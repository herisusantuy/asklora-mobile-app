import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/extensions.dart';
import 'bot_activities_transaction_history_model.dart';
import 'bot_summary_transaction_history_model.dart';

part 'bot_detail_transaction_history_response.g.dart';

@JsonSerializable()
class BotDetailTransactionHistoryResponse extends Equatable {
  final String pk;
  final String ticker;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'bot_id')
  final String botId;
  final String updated;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final String status;
  @JsonKey(name: 'action_status')
  final String? actionStatus;
  @JsonKey(name: 'bot_apps_name')
  final String botAppsName;
  @JsonKey(name: 'botstock_value')
  final double? botStockValue;
  @JsonKey(name: 'stock_value')
  final double? stockValue;
  final String duration;
  @JsonKey(name: 'rollover_count')
  final int? rolloverCount;
  @JsonKey(name: 'current_pnl_amount')
  final double? currentPnlAmount;
  @JsonKey(name: 'current_pnl_ret')
  final double? currentPnlRet;
  @JsonKey(name: 'max_loss_pct')
  final double maxLossPct;
  @JsonKey(name: 'target_profit_pct')
  final double targetProfitPct;
  @JsonKey(name: 'investment_amount')
  final double investmentAmount;
  final List<BotSummaryTransactionHistoryModel> summary;
  final List<BotActivitiesTransactionHistoryModel> activities;
  @JsonKey(name: 'days_to_expire')
  final double daysToExpire;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'expire_date')
  final String? expireDate;

  const BotDetailTransactionHistoryResponse(
      this.pk,
      this.ticker,
      this.tickerName,
      this.botId,
      this.updated,
      this.isActive,
      this.status,
      this.actionStatus,
      this.botAppsName,
      this.summary,
      this.activities,
      this.botStockValue,
      this.stockValue,
      this.duration,
      this.rolloverCount,
      this.currentPnlAmount,
      this.currentPnlRet,
      this.maxLossPct,
      this.targetProfitPct,
      this.investmentAmount,
      this.daysToExpire,
      this.startDate,
      this.expireDate);

  BotDetailTransactionHistoryResponse copyWith(
          {List<BotActivitiesTransactionHistoryModel>? activities}) =>
      BotDetailTransactionHistoryResponse(
          pk,
          ticker,
          tickerName,
          botId,
          updated,
          isActive,
          status,
          actionStatus,
          botAppsName,
          summary,
          activities ?? this.activities,
          botStockValue,
          stockValue,
          duration,
          rolloverCount,
          currentPnlAmount,
          currentPnlRet,
          maxLossPct,
          targetProfitPct,
          investmentAmount,
          daysToExpire,
          startDate,
          expireDate);

  String get rolloverCountString =>
      rolloverCount != null ? rolloverCount.toString() : 'NA';

  String get botStockValueString {
    double botStockValueDouble = checkDouble(botStockValue);
    return (botStockValueDouble > 0)
        ? botStockValueDouble.convertToCurrencyDecimal()
        : '/';
  }

  String get targetProfitPctString {
    double targetProfitPctDouble = checkDouble(targetProfitPct);
    return (targetProfitPctDouble > 0)
        ? targetProfitPctDouble.convertToCurrencyDecimal(decimalDigits: 2)
        : '/';
  }

  String get maxLossPctString {
    double maxLossPctDouble = checkDouble(maxLossPct).abs();
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

  String get currentPnlRetString {
    double currentPnlRetDouble = checkDouble(currentPnlRet);
    return (currentPnlRetDouble > 0)
        ? '+$currentPnlRetDouble%'
        : (currentPnlRetDouble < 0)
            ? '$currentPnlRetDouble%'
            : '/';
  }

  String get daysToExpireString => daysToExpire.abs().toInt().toString();

  String get startDateFormatted =>
      startDate != null ? formatDateTimeAsString(startDate) : 'NA';

  String get expireDateFormatted =>
      expireDate != null ? formatDateTimeAsString(expireDate) : 'NA';

  factory BotDetailTransactionHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BotDetailTransactionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BotDetailTransactionHistoryResponseToJson(this);

  @override
  List<Object?> get props => [
        pk,
        ticker,
        tickerName,
        botId,
        updated,
        isActive,
        status,
        actionStatus,
        botAppsName,
        summary,
        activities,
        botStockValue,
        stockValue,
        duration,
        rolloverCount,
        currentPnlAmount,
        currentPnlRet,
        maxLossPct,
        targetProfitPct,
        investmentAmount,
        daysToExpire,
        startDate,
        expireDate
      ];
}
