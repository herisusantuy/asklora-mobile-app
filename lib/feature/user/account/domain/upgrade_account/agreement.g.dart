// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agreement _$AgreementFromJson(Map<String, dynamic> json) => Agreement(
      agreement: json['agreement'] as String?,
      ipAddress: json['ip_address'] as String?,
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$AgreementToJson(Agreement instance) => <String, dynamic>{
      'agreement': instance.agreement,
      'ip_address': instance.ipAddress,
      'signature': instance.signature,
    };
