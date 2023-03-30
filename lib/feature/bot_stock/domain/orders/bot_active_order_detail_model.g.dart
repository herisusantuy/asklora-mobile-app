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
      json['is_active'] as String,
      json['ticker'] as String,
      json['ticker_name'] as String,
      json['status'] as String,
      json['current_pnl_ret'],
      json['current_price'],
      json['investment_amount'] as String?,
      json['bot_share'] as String?,
      json['bot_cash_balance'] as String?,
      json['action_status'] as String?,
      (json['avg_loss'] as num?)?.toDouble(),
      (json['avg_ret'] as num?)?.toDouble(),
      (json['avg_period'] as num?)?.toDouble(),
      (json['stock_value'] as num?)?.toDouble(),
      json['stock_cash_ratio'] as String?,
      (json['botStockValue'] as num?)?.toDouble(),
      performance: (json['performance'] as List<dynamic>?)
              ?.map((e) => ChartDataSet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      botAssetInStockPct:
          (json['bot_asset_in_stock_pct'] as num?)?.toDouble() ?? 0,
      investmentPeriod: json['investmentPeriod'] as String? ?? '',
      spotDate: json['spot_date'] as String? ?? '',
      dayTillExpiry: json['dayTillExpiry'] as String? ?? '',
      maxLossPct: (json['max_loss_pct'] as num?)?.toDouble() ?? 0,
      targetProfitPct: (json['target_profit_pct'] as num?)?.toDouble() ?? 0,
      rolloverCount: (json['rollover_count'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$BotActiveOrderDetailModelToJson(
        BotActiveOrderDetailModel instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'bot_id': instance.botId,
      'expire_date': instance.expireDate,
      'is_active': instance.isActive,
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
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
      'performance': instance.performance,
      'rollover_count': instance.rolloverCount,
      'avg_loss': instance.avgLoss,
      'avg_ret': instance.avgRet,
      'avg_period': instance.avgPeriod,
      'stock_value': instance.stockValue,
      'stock_cash_ratio': instance.stockCashRatio,
      'botStockValue': instance.botStockValue,
      'bot_asset_in_stock_pct': instance.botAssetInStockPct,
      'investmentPeriod': instance.investmentPeriod,
      'dayTillExpiry': instance.dayTillExpiry,
    };
