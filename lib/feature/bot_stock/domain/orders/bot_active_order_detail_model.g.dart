// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_active_order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotActiveOrderDetailModel _$BotActiveOrderDetailModelFromJson(
        Map<String, dynamic> json) =>
    BotActiveOrderDetailModel(
      json['uid'] as String,
      json['name'] as String,
      (json['botstock_value'] as num?)?.toDouble(),
      (json['investment_amount'] as num).toDouble(),
      (json['total_pnl'] as num).toDouble(),
      (json['performance'] as List<dynamic>)
          .map((e) =>
              BotPortfolioChartDataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bot_duration'] as String,
      json['spot_date'] as String,
      json['expire_date'] as String?,
      json['days_to_expire'] as int,
      (json['est_max_loss'] as num).toDouble(),
      (json['est_max_profit'] as num).toDouble(),
      json['status'] as String,
      json['rollover_count'] as int?,
      (json['avg_return_pct'] as num).toDouble(),
      (json['avg_loss_pct'] as num).toDouble(),
      (json['avg_period'] as num).toDouble(),
      BotInfo.fromJson(json['bot_info'] as Map<String, dynamic>),
      StockInfo.fromJson(json['stock_info'] as Map<String, dynamic>),
      (json['current_price'] as num?)?.toDouble(),
      (json['stock_value'] as num).toDouble(),
      (json['bot_asset_in_stock_pct'] as num).toDouble(),
      (json['bot_cash_balance'] as num).toDouble(),
      (json['bot_share'] as num).toDouble(),
      (json['current_pnl_ret'] as num).toDouble(),
      (json['max_loss_pct'] as num).toDouble(),
      (json['target_profit_pct'] as num).toDouble(),
    );

Map<String, dynamic> _$BotActiveOrderDetailModelToJson(
        BotActiveOrderDetailModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'botstock_value': instance.botStockValue,
      'investment_amount': instance.investmentAmount,
      'total_pnl': instance.totalPnL,
      'performance': instance.performance,
      'bot_duration': instance.botDuration,
      'spot_date': instance.spotDate,
      'expire_date': instance.expireDate,
      'days_to_expire': instance.daysToExpire,
      'est_max_loss': instance.estMaxLoss,
      'est_max_profit': instance.estMaxProfit,
      'status': instance.status,
      'rollover_count': instance.rolloverCount,
      'avg_return_pct': instance.avgReturnPct,
      'avg_loss_pct': instance.avgLossPct,
      'avg_period': instance.avgPeriod,
      'bot_info': instance.botInfo,
      'stock_info': instance.stockInfo,
      'current_price': instance.currentPrice,
      'stock_value': instance.stockValue,
      'bot_asset_in_stock_pct': instance.botAssetInStockPct,
      'bot_cash_balance': instance.botCashBalance,
      'bot_share': instance.botShare,
      'current_pnl_ret': instance.currentPnlRet,
      'max_loss_pct': instance.maxLossPct,
      'target_profit_pct': instance.targetProfitPct,
    };
