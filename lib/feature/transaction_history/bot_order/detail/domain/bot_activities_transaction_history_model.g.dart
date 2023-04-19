// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_activities_transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotActivitiesTransactionHistoryModel
    _$BotActivitiesTransactionHistoryModelFromJson(Map<String, dynamic> json) =>
        BotActivitiesTransactionHistoryModel(
          json['pk'] as String,
          json['created'] as String,
          json['side'] as String,
          (json['filled_qty'] as num).toDouble(),
          (json['filled_avg_price'] as num).toDouble(),
          (json['invested'] as num).toDouble(),
          (json['pnl_ret'] as num).toDouble(),
          (json['pnl_amt'] as num).toDouble(),
        );

Map<String, dynamic> _$BotActivitiesTransactionHistoryModelToJson(
        BotActivitiesTransactionHistoryModel instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'created': instance.created,
      'side': instance.side,
      'filled_qty': instance.filledQty,
      'filled_avg_price': instance.filledAvgPrice,
      'invested': instance.invested,
      'pnl_ret': instance.pnlRet,
      'pnl_amt': instance.pnlAmt,
    };
