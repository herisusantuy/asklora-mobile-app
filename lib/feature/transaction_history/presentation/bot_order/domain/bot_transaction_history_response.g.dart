// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_transaction_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotTransactionHistoryResponse _$BotTransactionHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    BotTransactionHistoryResponse(
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
          .map((e) =>
              BotSummaryTransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BotTransactionHistoryResponseToJson(
        BotTransactionHistoryResponse instance) =>
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
    };
