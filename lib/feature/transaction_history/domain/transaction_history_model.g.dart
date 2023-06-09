// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryModel _$TransactionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    TransactionHistoryModel(
      json['id'],
      $enumDecode(_$TransactionHistoryTypeEnumMap, json['history_type']),
      DateTime.parse(json['created'] as String),
      json['updated'] as String,
      json['title'] as String,
      json['status'] as String,
      json['amount'],
      timeComplete: json['time_complete'] as String?,
      bankCode: json['bank_code'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
      isDummy: json['is_dummy'] as bool? ?? false,
    );

Map<String, dynamic> _$TransactionHistoryModelToJson(
        TransactionHistoryModel instance) =>
    <String, dynamic>{
      'history_type':
          _$TransactionHistoryTypeEnumMap[instance.transactionHistoryType]!,
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated,
      'title': instance.title,
      'status': instance.status,
      'amount': instance.amount,
      'bank_code': instance.bankCode,
      'bank_account_number': instance.bankAccountNumber,
      'time_complete': instance.timeComplete,
      'is_dummy': instance.isDummy,
    };

const _$TransactionHistoryTypeEnumMap = {
  TransactionHistoryType.all: 'all',
  TransactionHistoryType.bot: 'bot',
  TransactionHistoryType.transfer: 'transfer',
};
