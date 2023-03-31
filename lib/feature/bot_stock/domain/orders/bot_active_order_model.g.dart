// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_active_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotActiveOrderModel _$BotActiveOrderModelFromJson(Map<String, dynamic> json) =>
    BotActiveOrderModel(
      json['pk'] as String,
      json['bot_id'] as String,
      json['expire_date'] as String,
      json['is_active'],
      json['ticker'] as String,
      json['ticker_name'] as String,
      json['status'] as String,
      (json['current_pnl_ret'] as num?)?.toDouble(),
      (json['current_price'] as num).toDouble(),
      botAppsName: json['bot_apps_name'] as String? ?? 'Pull Up',
    );

Map<String, dynamic> _$BotActiveOrderModelToJson(
        BotActiveOrderModel instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'bot_id': instance.botId,
      'expire_date': instance.expireDate,
      'is_active': instance.isActive,
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
      'status': instance.status,
      'current_pnl_ret': instance.currentPnlRet,
      'current_price': instance.currentPrice,
      'bot_apps_name': instance.botAppsName,
    };
