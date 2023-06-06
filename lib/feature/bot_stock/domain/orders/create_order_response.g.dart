// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotOrderResponse _$BotOrderResponseFromJson(Map<String, dynamic> json) =>
    BotOrderResponse(
      json['uid'] as String,
      json['name'] as String,
      json['status'] as String,
      json['is_active'] as bool,
      (json['total_pnl'] as num).toDouble(),
      json['expire_date'] as String?,
      json['ticker_name'] as String,
      (json['current_price'] as num).toDouble(),
      json['is_dummy'] as bool,
      json['spot_date'] as String,
      json['ticker'] as String,
      json['optimalTime'] as String?,
      json['newExpireDate'] as String?,
    );

Map<String, dynamic> _$BotOrderResponseToJson(BotOrderResponse instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'status': instance.status,
      'is_active': instance.isActive,
      'total_pnl': instance.totalPnL,
      'expire_date': instance.expireDate,
      'ticker_name': instance.tickerName,
      'current_price': instance.currentPrice,
      'is_dummy': instance.isDummy,
      'spot_date': instance.spotDate,
      'ticker': instance.ticker,
      'optimalTime': instance.optimalTime,
      'newExpireDate': instance.newExpireDate,
    };
