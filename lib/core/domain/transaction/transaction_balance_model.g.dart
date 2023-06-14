// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionBalanceModel _$TransactionBalanceModelFromJson(
        Map<String, dynamic> json) =>
    TransactionBalanceModel(
      (json['withdrawable_balance'] as num).toDouble(),
      (json['buying_power'] as num).toDouble(),
      (json['total_bot_stock'] as num).toDouble(),
      (json['total_pnl_pct'] as num).toDouble(),
      (json['total_portfolio'] as num).toDouble(),
    );

Map<String, dynamic> _$TransactionBalanceModelToJson(
        TransactionBalanceModel instance) =>
    <String, dynamic>{
      'withdrawable_balance': instance.withdrawableBalance,
      'buying_power': instance.buyingPower,
      'total_bot_stock': instance.totalBotStock,
      'total_pnl_pct': instance.totalPnLPct,
      'total_portfolio': instance.totalPortfolio,
    };
