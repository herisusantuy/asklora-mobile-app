// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_detail_transaction_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotDetailTransactionHistoryResponse
    _$BotDetailTransactionHistoryResponseFromJson(Map<String, dynamic> json) =>
        BotDetailTransactionHistoryResponse(
          json['uid'] as String,
          json['name'] as String,
          BotInfo.fromJson(json['bot_info'] as Map<String, dynamic>),
          (json['summary'] as List<dynamic>)
              .map((e) => BotSummaryTransactionHistoryModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          (json['activities'] as List<dynamic>)
              .map((e) => BotActivitiesTransactionHistoryModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          (json['performances'] as List<dynamic>)
              .map((e) =>
                  BotPortfolioChartDataSet.fromJson(e as Map<String, dynamic>))
              .toList(),
          (json['investment_amount'] as num).toDouble(),
          (json['final_return'] as num?)?.toDouble(),
          (json['total_pnl_pct'] as num).toDouble(),
          json['bot_duration'] as String,
          json['spot_date'] as String,
          json['expire_date'] as String?,
          json['days_to_expire'] as int,
          (json['est_max_loss'] as num).toDouble(),
          (json['est_max_profit'] as num).toDouble(),
          json['status'] as String,
          json['rollover_count'] as int,
          (json['bot_stock_value'] as num).toDouble(),
        );

Map<String, dynamic> _$BotDetailTransactionHistoryResponseToJson(
        BotDetailTransactionHistoryResponse instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'bot_info': instance.botInfo,
      'summary': instance.summary,
      'activities': instance.activities,
      'performances': instance.performances,
      'investment_amount': instance.investmentAmount,
      'final_return': instance.finalReturn,
      'total_pnl_pct': instance.totalPnLPct,
      'bot_duration': instance.botDuration,
      'spot_date': instance.spotDate,
      'expire_date': instance.expireDate,
      'days_to_expire': instance.daysToExpire,
      'est_max_loss': instance.estMaxLoss,
      'est_max_profit': instance.estMaxProfit,
      'status': instance.status,
      'rollover_count': instance.rolloverCount,
      'bot_stock_value': instance.botStockValue,
    };
