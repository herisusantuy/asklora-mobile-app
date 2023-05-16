// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryModel _$TransactionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    TransactionHistoryModel(
      json['id'],
      $enumDecode(
          _$TransactionHistoryTypeEnumMap, json['transaction_history_type']),
      json['created'] as String,
      json['updated'] as String,
      json['title'] as String,
      json['status'] as String,
      json['amount'],
      isDummy: json['is_dummy'] as bool? ?? false,
    );

Map<String, dynamic> _$TransactionHistoryModelToJson(
        TransactionHistoryModel instance) =>
    <String, dynamic>{
      'transaction_history_type':
          _$TransactionHistoryTypeEnumMap[instance.transactionHistoryType]!,
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'title': instance.title,
      'status': instance.status,
      'amount': instance.amount,
      'is_dummy': instance.isDummy,
    };

const _$TransactionHistoryTypeEnumMap = {
  TransactionHistoryType.all: 'all',
  TransactionHistoryType.bot: 'bot',
  TransactionHistoryType.transfer: 'transfer',
};
