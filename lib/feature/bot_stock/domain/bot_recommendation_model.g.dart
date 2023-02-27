// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotRecommendationModel _$BotRecommendationModelFromJson(
        Map<String, dynamic> json) =>
    BotRecommendationModel(
      json['id'] as int,
      json['suitability'] as String,
      json['benefit'] as String,
      json['bot_id'] as String,
      json['bot_word'] as String,
      json['bot_type'] as String,
      json['bot_app_type'] as String,
      json['ticker'] as String,
      json['ticker_name'] as String,
      json['ticker_symbol'] as String,
      json['latest_price'] as String,
      freeBot: json['freeBot'] as bool? ?? false,
      selectable: json['selectable'] as bool? ?? false,
    );

Map<String, dynamic> _$BotRecommendationModelToJson(
        BotRecommendationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'suitability': instance.suitability,
      'benefit': instance.benefit,
      'bot_id': instance.botId,
      'bot_word': instance.botWord,
      'bot_type': instance.botType,
      'bot_app_type': instance.botAppType,
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
      'ticker_symbol': instance.tickerSymbol,
      'latest_price': instance.latestPrice,
      'freeBot': instance.freeBot,
      'selectable': instance.selectable,
    };
