// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBanks _$ListBanksFromJson(Map<String, dynamic> json) => ListBanks(
      json['clearing_code'] as int,
      json['bank_name'] as String,
      json['chinese_name'] as String,
      json['swift_bic'] as String?,
    );

Map<String, dynamic> _$ListBanksToJson(ListBanks instance) => <String, dynamic>{
      'clearing_code': instance.clearingCode,
      'bank_name': instance.bankName,
      'chinese_name': instance.chineseName,
      'swift_bic': instance.swiftBic,
    };
