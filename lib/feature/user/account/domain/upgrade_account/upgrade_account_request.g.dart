// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeAccountRequest _$UpgradeAccountRequestFromJson(
        Map<String, dynamic> json) =>
    UpgradeAccountRequest(
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      identity: json['identity'] == null
          ? null
          : Identity.fromJson(json['identity'] as Map<String, dynamic>),
      trustedContact: json['trusted_contact'] == null
          ? null
          : TrustedContact.fromJson(
              json['trusted_contact'] as Map<String, dynamic>),
      disclosures: json['disclosures'] == null
          ? null
          : Disclosures.fromJson(json['disclosures'] as Map<String, dynamic>),
      agreements: (json['agreements'] as List<dynamic>?)
          ?.map((e) => Agreement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpgradeAccountRequestToJson(
        UpgradeAccountRequest instance) =>
    <String, dynamic>{
      'contact': instance.contact?.toJson(),
      'identity': instance.identity?.toJson(),
      'trusted_contact': instance.trustedContact?.toJson(),
      'disclosures': instance.disclosures?.toJson(),
      'agreements': instance.agreements?.map((e) => e.toJson()).toList(),
    };
