// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_bot_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventBotDetail _$EventBotDetailFromJson(Map<String, dynamic> json) =>
    EventBotDetail(
      ticker: json['ticker'] as String,
      botType: json['bot_type'] as String,
      duration: json['duration'] as String,
      totalPnl: json['total_pnl'] as String,
      expiryDate: json['expiry_date'] as String,
    );

Map<String, dynamic> _$EventBotDetailToJson(EventBotDetail instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'bot_type': instance.botType,
      'duration': instance.duration,
      'total_pnl': instance.totalPnl,
      'expiry_date': instance.expiryDate,
    };
