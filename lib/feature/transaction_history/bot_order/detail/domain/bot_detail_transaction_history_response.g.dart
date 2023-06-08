// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_detail_transaction_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotDetailTransactionHistoryResponse
    _$BotDetailTransactionHistoryResponseFromJson(Map<String, dynamic> json) =>
        BotDetailTransactionHistoryResponse(
          json['pk'] as String,
          json['ticker'] as String,
          json['ticker_name'] as String,
          json['bot_id'] as String,
          json['updated'] as String,
          json['is_active'] as bool,
          json['status'] as String,
          json['action_status'] as String?,
          json['bot_apps_name'] as String,
          (json['summary'] as List<dynamic>)
              .map((e) => BotSummaryTransactionHistoryModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          (json['activities'] as List<dynamic>)
              .map((e) => BotActivitiesTransactionHistoryModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          (json['botstock_value'] as num?)?.toDouble(),
          (json['stock_value'] as num?)?.toDouble(),
          json['duration'] as String,
          json['rollover_count'] as int?,
          (json['current_pnl_amount'] as num?)?.toDouble(),
          (json['current_pnl_ret'] as num?)?.toDouble(),
          (json['max_loss_pct'] as num).toDouble(),
          (json['target_profit_pct'] as num).toDouble(),
          (json['investment_amount'] as num).toDouble(),
          (json['days_to_expire'] as num).toDouble(),
          json['start_date'] as String?,
          json['expire_date'] as String?,
        );

Map<String, dynamic> _$BotDetailTransactionHistoryResponseToJson(
        BotDetailTransactionHistoryResponse instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
      'bot_id': instance.botId,
      'updated': instance.updated,
      'is_active': instance.isActive,
      'status': instance.status,
      'action_status': instance.actionStatus,
      'bot_apps_name': instance.botAppsName,
      'botstock_value': instance.botStockValue,
      'stock_value': instance.stockValue,
      'duration': instance.duration,
      'rollover_count': instance.rolloverCount,
      'current_pnl_amount': instance.currentPnlAmount,
      'current_pnl_ret': instance.currentPnlRet,
      'max_loss_pct': instance.maxLossPct,
      'target_profit_pct': instance.targetProfitPct,
      'investment_amount': instance.investmentAmount,
      'summary': instance.summary,
      'activities': instance.activities,
      'days_to_expire': instance.daysToExpire,
      'start_date': instance.startDate,
      'expire_date': instance.expireDate,
    };
