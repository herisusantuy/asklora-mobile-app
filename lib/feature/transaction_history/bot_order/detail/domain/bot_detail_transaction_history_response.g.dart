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
      'summary': instance.summary,
      'activities': instance.activities,
    };
