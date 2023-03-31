// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_active_order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotActiveOrderDetailModel _$BotActiveOrderDetailModelFromJson(
        Map<String, dynamic> json) =>
    BotActiveOrderDetailModel(
      json['pk'] as String,
      json['bot_id'] as String,
      json['expire_date'] as String,
      json['is_active'] as bool,
      json['status'] as String,
      (json['current_pnl_ret'] as num?)?.toDouble(),
      (json['current_price'] as num).toDouble(),
      (json['investment_amount'] as num?)?.toDouble(),
      (json['bot_share'] as num?)?.toDouble(),
      (json['bot_cash_balance'] as num?)?.toDouble(),
      json['action_status'] as String?,
      (json['avg_loss'] as num?)?.toDouble(),
      (json['avg_return'] as num?)?.toDouble(),
      (json['avg_period'] as num?)?.toDouble(),
      (json['stock_value'] as num?)?.toDouble(),
      (json['botstock_value'] as num?)?.toDouble(),
      BotModel.fromJson(json['bot_detail'] as Map<String, dynamic>),
      TickerDetailModel.fromJson(json['ticker_detail'] as Map<String, dynamic>),
      botAssetInStockPct: (json['asset_pct'] as num?)?.toDouble() ?? 0,
      spotDate: json['spot_date'] as String? ?? '',
      daysToExpire: json['days_to_expire'] as int? ?? 0,
      maxLossPct: (json['max_loss_pct'] as num?)?.toDouble() ?? 0,
      targetProfitPct: (json['target_profit_pct'] as num?)?.toDouble() ?? 0,
      rolloverCount: json['rollover_count'] as int? ?? 0,
    );

Map<String, dynamic> _$BotActiveOrderDetailModelToJson(
        BotActiveOrderDetailModel instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'bot_id': instance.botId,
      'expire_date': instance.expireDate,
      'is_active': instance.isActive,
      'status': instance.status,
      'current_pnl_ret': instance.currentPnlRet,
      'current_price': instance.currentPrice,
      'spot_date': instance.spotDate,
      'investment_amount': instance.investmentAmount,
      'bot_share': instance.botShare,
      'bot_cash_balance': instance.botCashBalance,
      'max_loss_pct': instance.maxLossPct,
      'target_profit_pct': instance.targetProfitPct,
      'action_status': instance.actionStatus,
      'rollover_count': instance.rolloverCount,
      'avg_loss': instance.avgLoss,
      'avg_return': instance.avgReturn,
      'avg_period': instance.avgPeriod,
      'stock_value': instance.stockValue,
      'botstock_value': instance.botStockValue,
      'bot_detail': instance.botDetail,
      'ticker_detail': instance.tickerDetail,
      'asset_pct': instance.botAssetInStockPct,
      'days_to_expire': instance.daysToExpire,
    };

TickerDetailModel _$TickerDetailModelFromJson(Map<String, dynamic> json) =>
    TickerDetailModel(
      json['description'] as String,
      json['symbol'] as String,
      json['ticker'] as String,
      json['ticker_name'] as String,
      json['chinese_name'] as String,
      json['traditional_name'] as String,
      json['sector'] as String,
      json['industry'] as String,
      json['ceo'] as String,
      json['employees'] as int,
      json['founded'] as String,
      json['headquarters'] as String,
    );

Map<String, dynamic> _$TickerDetailModelToJson(TickerDetailModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'symbol': instance.symbol,
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
      'chinese_name': instance.chineseName,
      'traditional_name': instance.traditionalName,
      'sector': instance.sector,
      'industry': instance.industry,
      'ceo': instance.ceo,
      'employees': instance.employees,
      'founded': instance.founded,
      'headquarters': instance.headquarters,
    };
