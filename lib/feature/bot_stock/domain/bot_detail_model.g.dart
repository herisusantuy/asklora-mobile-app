// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotDetailModel _$BotDetailModelFromJson(Map<String, dynamic> json) =>
    BotDetailModel(
      BotModel.fromJson(json['bot'] as Map<String, dynamic>),
      json['symbol'] as String,
      json['ticker'] as String,
      json['ticker_name'] as String,
      json['chinese_name'] as String,
      json['traditional_name'] as String,
      (json['price'] as num).toDouble(),
      json['estimated_expired_date'] as String,
      (json['estimated_take_profit_pct'] as num).toDouble(),
      (json['estimated_take_profit_price'] as num).toDouble(),
      (json['estimated_stop_loss_pct'] as num).toDouble(),
      (json['estimated_stop_loss_price'] as num).toDouble(),
      json['description'] as String,
      json['market_cap'] as String?,
      (json['performance'] as List<dynamic>)
          .map((e) => ChartDataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['prev_close_price'] as num).toDouble(),
      (json['prev_close_changes'] as num).toDouble(),
      (json['prev_close_pct'] as num).toDouble(),
      json['estimated_start_date'] as String,
      json['sector'] as String,
      json['industry'] as String,
      json['prev_close_date'] as String,
      json['ceo'] as String,
      json['employees'] as int,
      json['founded'] as String,
      json['headquarters'] as String,
    );

Map<String, dynamic> _$BotDetailModelToJson(BotDetailModel instance) =>
    <String, dynamic>{
      'bot': instance.bot,
      'symbol': instance.symbol,
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
      'chinese_name': instance.chineseName,
      'traditional_name': instance.traditionalName,
      'price': instance.price,
      'estimated_expired_date': instance.estimatedExpiredDate,
      'estimated_take_profit_pct': instance.estimatedTakeProfitPct,
      'estimated_take_profit_price': instance.estimatedTakeProfitPrice,
      'estimated_stop_loss_pct': instance.estimatedStopLossPct,
      'estimated_stop_loss_price': instance.estimatedStopLossPrice,
      'description': instance.description,
      'market_cap': instance.marketCap,
      'performance': instance.performance,
      'prev_close_price': instance.prevClosePrice,
      'prev_close_date': instance.prevCloseDate,
      'estimated_start_date': instance.estimatedStartDate,
      'prev_close_changes': instance.prevCloseChanges,
      'prev_close_pct': instance.prevClosePct,
      'sector': instance.sector,
      'industry': instance.industry,
      'ceo': instance.ceo,
      'employees': instance.employees,
      'founded': instance.founded,
      'headquarters': instance.headquarters,
    };

BotModel _$BotModelFromJson(Map<String, dynamic> json) => BotModel(
      json['bot_id'] as String,
      json['duration'] as String,
      json['bot_name'] as String,
      BotDescriptionModel.fromJson(
          json['bot_description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BotModelToJson(BotModel instance) => <String, dynamic>{
      'bot_id': instance.botId,
      'duration': instance.duration,
      'bot_name': instance.botName,
      'bot_description': instance.botDescription,
    };

BotDescriptionModel _$BotDescriptionModelFromJson(Map<String, dynamic> json) =>
    BotDescriptionModel(
      json['detail'] as String,
      json['suited'] as String,
      json['works'] as String,
    );

Map<String, dynamic> _$BotDescriptionModelToJson(
        BotDescriptionModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'suited': instance.suited,
      'works': instance.works,
    };

PerformanceModel _$PerformanceModelFromJson(Map<String, dynamic> json) =>
    PerformanceModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ChartDataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PerformanceModelToJson(PerformanceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
