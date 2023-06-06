// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotDetailModel _$BotDetailModelFromJson(Map<String, dynamic> json) =>
    BotDetailModel(
      json['bot_id'] as String,
      BotInfo.fromJson(json['bot_info'] as Map<String, dynamic>),
      StockInfo.fromJson(json['stock_info'] as Map<String, dynamic>),
      (json['price'] as num).toDouble(),
      (json['prev_close_amt'] as num).toDouble(),
      (json['prev_close_price'] as num).toDouble(),
      (json['est_stop_loss_price'] as num).toDouble(),
      (json['est_take_profit_price'] as num).toDouble(),
      (json['prev_close_pct'] as num).toDouble(),
      (json['est_stop_loss_pct'] as num).toDouble(),
      (json['est_take_profit_pct'] as num).toDouble(),
      json['prev_close_date'] as String,
      json['start_date'] as String,
      json['est_end_date'] as String,
      (json['performance'] as List<dynamic>)
          .map((e) =>
              BotRecommendationChartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bot_duration'] as String,
      json['market_cap'] as String,
    );

Map<String, dynamic> _$BotDetailModelToJson(BotDetailModel instance) =>
    <String, dynamic>{
      'bot_id': instance.botId,
      'bot_info': instance.botInfo,
      'stock_info': instance.stockInfo,
      'price': instance.price,
      'prev_close_amt': instance.prevCloseAmt,
      'prev_close_price': instance.prevClosePrice,
      'est_stop_loss_price': instance.estStopLossPrice,
      'est_take_profit_price': instance.estTakeProfitPrice,
      'prev_close_pct': instance.prevClosePct,
      'est_stop_loss_pct': instance.estStopLossPct,
      'est_take_profit_pct': instance.estTakeProfitPct,
      'prev_close_date': instance.prevCloseDate,
      'start_date': instance.startDate,
      'est_end_date': instance.estEndDate,
      'performance': instance.performance,
      'bot_duration': instance.botDuration,
      'market_cap': instance.marketCap,
    };

BotInfo _$BotInfoFromJson(Map<String, dynamic> json) => BotInfo(
      json['bot_type'] as String,
      json['bot_name'] as String,
      BotDescriptionModel.fromJson(
          json['bot_description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BotInfoToJson(BotInfo instance) => <String, dynamic>{
      'bot_type': instance.botType,
      'bot_name': instance.botName,
      'bot_description': instance.botDescription,
    };

StockInfo _$StockInfoFromJson(Map<String, dynamic> json) => StockInfo(
      json['symbol'] as String,
      json['ticker'] as String,
      json['ticker_name'] as String,
      json['chinese_name'] as String,
      json['traditional_name'] as String,
      json['description'] as String,
      json['sector'] as String,
      json['industry'] as String,
      json['ceo'] as String,
      json['employees'] as int,
      json['headquarter'] as String,
      json['founded'] as String,
    );

Map<String, dynamic> _$StockInfoToJson(StockInfo instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
      'chinese_name': instance.chineseName,
      'traditional_name': instance.traditionalName,
      'description': instance.description,
      'sector': instance.sector,
      'industry': instance.industry,
      'ceo': instance.ceo,
      'employees': instance.employees,
      'headquarter': instance.headquarter,
      'founded': instance.founded,
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
