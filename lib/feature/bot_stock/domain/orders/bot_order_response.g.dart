// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotOrderResponse _$BotOrderResponseFromJson(Map<String, dynamic> json) =>
    BotOrderResponse(
      botOrder: json['bot_order'] as String,
      botAction: json['bot_action'] as String,
      optimalTime: json['optimal_time'] as String?,
    );

Map<String, dynamic> _$BotOrderResponseToJson(BotOrderResponse instance) =>
    <String, dynamic>{
      'bot_order': instance.botOrder,
      'bot_action': instance.botAction,
      'optimal_time': instance.optimalTime,
    };
