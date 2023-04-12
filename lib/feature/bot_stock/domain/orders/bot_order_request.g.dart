// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotOrderRequest _$BotOrderRequestFromJson(Map<String, dynamic> json) =>
    BotOrderRequest(
      orderId: json['order_id'] as String,
      orderType: json['order_type'] as String? ?? 'POOL',
    );

Map<String, dynamic> _$BotOrderRequestToJson(BotOrderRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_type': instance.orderType,
    };
