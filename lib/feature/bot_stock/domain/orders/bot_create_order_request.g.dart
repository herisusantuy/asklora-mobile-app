// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotCreateOrderRequest _$BotCreateOrderRequestFromJson(
        Map<String, dynamic> json) =>
    BotCreateOrderRequest(
      ticker: json['ticker'] as String,
      botId: json['bot_id'] as String,
      spotDate: json['spot_date'] as String,
      investmentAmount: (json['investment_amount'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      fraction: json['fraction'] as bool? ?? false,
      margin: json['margin'] as int? ?? 1,
      orderType: json['order_type'] as String? ?? 'POOL',
      isAggregate: json['is_aggregate'] as bool? ?? false,
    );

Map<String, dynamic> _$BotCreateOrderRequestToJson(
        BotCreateOrderRequest instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'bot_id': instance.botId,
      'spot_date': instance.spotDate,
      'investment_amount': instance.investmentAmount,
      'price': instance.price,
      'fraction': instance.fraction,
      'margin': instance.margin,
      'order_type': instance.orderType,
      'is_aggregate': instance.isAggregate,
    };
