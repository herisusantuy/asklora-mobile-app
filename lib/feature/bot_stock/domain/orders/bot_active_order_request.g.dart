// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_active_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotActiveOrderRequest _$BotActiveOrderRequestFromJson(
        Map<String, dynamic> json) =>
    BotActiveOrderRequest(
      status:
          (json['status'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BotActiveOrderRequestToJson(
        BotActiveOrderRequest instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
