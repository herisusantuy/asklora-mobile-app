// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_summary_transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotSummaryTransactionHistoryModel _$BotSummaryTransactionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    BotSummaryTransactionHistoryModel(
      json['uid'] as String,
      json['date'] as String,
      json['status'] as String,
      (json['amount'] as num).toDouble(),
      (json['fee'] as num).toDouble(),
      (json['totalPnL'] as num).toDouble(),
    );

Map<String, dynamic> _$BotSummaryTransactionHistoryModelToJson(
        BotSummaryTransactionHistoryModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'date': instance.date,
      'amount': instance.amount,
      'fee': instance.fee,
      'status': instance.status,
      'totalPnL': instance.totalPnL,
    };
