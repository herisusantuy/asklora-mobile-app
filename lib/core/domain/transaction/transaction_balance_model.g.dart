// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionBalanceModel _$TransactionBalanceModelFromJson(
        Map<String, dynamic> json) =>
    TransactionBalanceModel(
      json['fully_settled_balance_hkd'] as String,
      json['fully_settled_balance_usd'] as String,
      json['withdrawable_balance'] as String,
      (json['totalPortfolio'] as num?)?.toDouble(),
      (json['buyingPower'] as num?)?.toDouble(),
      (json['totalBotstockValue'] as num?)?.toDouble(),
      (json['totalPnL'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionBalanceModelToJson(
        TransactionBalanceModel instance) =>
    <String, dynamic>{
      'fully_settled_balance_hkd': instance.fullySettledBalanceHkd,
      'fully_settled_balance_usd': instance.fullySettledBalanceUsd,
      'withdrawable_balance': instance.withdrawableBalance,
      'totalPortfolio': instance.totalPortfolio,
      'buyingPower': instance.buyingPower,
      'totalBotstockValue': instance.totalBotstockValue,
      'totalPnL': instance.totalPnL,
    };
