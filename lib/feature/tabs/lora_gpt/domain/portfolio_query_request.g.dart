// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioQueryRequest _$PortfolioQueryRequestFromJson(
        Map<String, dynamic> json) =>
    PortfolioQueryRequest(
      json['input'] as String,
      json['user_id'] as String,
      json['username'] as String,
      json['platform'] as String,
      (json['total_pnl'] as num).toDouble(),
    );

Map<String, dynamic> _$PortfolioQueryRequestToJson(
        PortfolioQueryRequest instance) =>
    <String, dynamic>{
      'input': instance.input,
      'user_id': instance.userId,
      'username': instance.username,
      'platform': instance.platform,
      'total_pnl': instance.totalPnl,
    };

Botstock _$BotstockFromJson(Map<String, dynamic> json) => Botstock(
      ticker: json['ticker'] as String,
      botType: json['bot_type'] as String,
      duration: json['duration'] as String,
      totalPnl: json['total_pnl'] as String,
      expiryDate: json['expiry_date'] as String,
    );

Map<String, dynamic> _$BotstockToJson(Botstock instance) => <String, dynamic>{
      'ticker': instance.ticker,
      'bot_type': instance.botType,
      'duration': instance.duration,
      'total_pnl': instance.totalPnl,
      'expiry_date': instance.expiryDate,
    };
