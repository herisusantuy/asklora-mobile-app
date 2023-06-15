// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotCreateOrderResponse _$BotCreateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    BotCreateOrderResponse(
      json['uid'] as String,
      json['name'] as String,
      json['bot_apps_name'] as String,
      json['status'] as String,
      json['is_active'] as bool,
      (json['total_pnl_pct'] as num).toDouble(),
      json['expire_date'] as String?,
      json['ticker_name'] as String,
      (json['current_price'] as num).toDouble(),
      json['is_dummy'] as bool,
      json['spot_date'] as String,
      json['ticker'] as String,
    );

Map<String, dynamic> _$BotCreateOrderResponseToJson(
        BotCreateOrderResponse instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'bot_apps_name': instance.botAppsName,
      'status': instance.status,
      'is_active': instance.isActive,
      'total_pnl_pct': instance.totalPnLPct,
      'expire_date': instance.expireDate,
      'ticker_name': instance.tickerName,
      'current_price': instance.currentPrice,
      'is_dummy': instance.isDummy,
      'spot_date': instance.spotDate,
      'ticker': instance.ticker,
    };
