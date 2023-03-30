// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotCreateOrderResponse _$BotCreateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    BotCreateOrderResponse(
      botOrder: json['bot_order'] as String,
      botAction: json['bot_action'] as String,
    );

Map<String, dynamic> _$BotCreateOrderResponseToJson(
        BotCreateOrderResponse instance) =>
    <String, dynamic>{
      'bot_order': instance.botOrder,
      'bot_action': instance.botAction,
    };
