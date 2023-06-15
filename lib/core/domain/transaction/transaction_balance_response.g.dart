// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionBalanceResponse _$TransactionBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionBalanceResponse(
      (json['withdrawable_balance'] as num).toDouble(),
      (json['buying_power'] as num).toDouble(),
      (json['total_bot_stock'] as num).toDouble(),
      (json['total_pnl_pct'] as num).toDouble(),
      (json['total_portfolio'] as num).toDouble(),
    );

Map<String, dynamic> _$TransactionBalanceResponseToJson(
        TransactionBalanceResponse instance) =>
    <String, dynamic>{
      'withdrawable_balance': instance.withdrawableBalance,
      'buying_power': instance.buyingPower,
      'total_bot_stock': instance.totalBotStock,
      'total_pnl_pct': instance.totalPnLPct,
      'total_portfolio': instance.totalPortfolio,
    };
