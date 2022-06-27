// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_requirements_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradeRequirementsStatus _$TradeRequirementsStatusFromJson(
        Map<String, dynamic> json) =>
    TradeRequirementsStatus(
      json['identity'] as bool,
      json['contact'] as bool,
      json['disclosures'] as bool,
      json['agreement'] as bool,
      json['kyc'] as bool,
    );

Map<String, dynamic> _$TradeRequirementsStatusToJson(
        TradeRequirementsStatus instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'contact': instance.contact,
      'disclosures': instance.disclosures,
      'agreement': instance.agreement,
      'kyc': instance.kyc,
    };
