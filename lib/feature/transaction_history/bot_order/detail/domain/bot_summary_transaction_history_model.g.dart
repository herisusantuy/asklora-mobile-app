// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_summary_transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotSummaryTransactionHistoryModel _$BotSummaryTransactionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    BotSummaryTransactionHistoryModel(
      json['pk'] as String,
      json['created'] as String,
      json['updated'] as String,
      json['status'] as String,
      (json['investment_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$BotSummaryTransactionHistoryModelToJson(
        BotSummaryTransactionHistoryModel instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'created': instance.created,
      'updated': instance.updated,
      'status': instance.status,
      'investment_amount': instance.investmentAmount,
    };
