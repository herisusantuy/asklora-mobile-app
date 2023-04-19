import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
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
  final double botStockValue;
  @JsonKey(name: 'stock_value')
  final double stockValue;
  final String duration;
  @JsonKey(name: 'rollover_count')
  final int rolloverCount;
  @JsonKey(name: 'current_pnl_amount')
  final double currentPnlAmount;
  @JsonKey(name: 'current_pnl_ret')
  final double currentPnlRet;
  @JsonKey(name: 'max_loss_pct')
  final double maxLossPct;
  @JsonKey(name: 'target_profit_pct')
  final double targetProfitPct;
  @JsonKey(name: 'investment_amount')
  final double investmentAmount;
  final List<BotSummaryTransactionHistoryModel> summary;
  final List<BotActivitiesTransactionHistoryModel> activities;

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
      this.investmentAmount);

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
          investmentAmount);

  String get botStockValueString {
    double botStockValueDouble = checkDouble(botStockValue);
    return (botStockValueDouble > 0)
        ? botStockValueDouble.convertToCurrencyDecimal()
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
    investmentAmount
      ];
}
