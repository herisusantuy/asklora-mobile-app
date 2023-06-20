// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotOrderResponse _$BotOrderResponseFromJson(Map<String, dynamic> json) =>
    BotOrderResponse(
      botOrder: json['bot_order'] as String,
      botAction: json['bot_action'] as String?,
    );

Map<String, dynamic> _$BotOrderResponseToJson(BotOrderResponse instance) =>
    <String, dynamic>{
      'bot_order': instance.botOrder,
      'bot_action': instance.botAction,
    };

TerminateOrderResponse _$TerminateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    TerminateOrderResponse(
      json['optimal_time'] as String,
    );

Map<String, dynamic> _$TerminateOrderResponseToJson(
        TerminateOrderResponse instance) =>
    <String, dynamic>{
      'optimal_time': instance.optimalTime,
    };

RolloverOrderResponse _$RolloverOrderResponseFromJson(
        Map<String, dynamic> json) =>
    RolloverOrderResponse(
      json['new_expire_date'] as String,
      botOrder: json['bot_order'] as String,
      botAction: json['bot_action'] as String?,
    );

Map<String, dynamic> _$RolloverOrderResponseToJson(
        RolloverOrderResponse instance) =>
    <String, dynamic>{
      'bot_order': instance.botOrder,
      'bot_action': instance.botAction,
      'new_expire_date': instance.newExpireDate,
    };
