// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_kyc_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveKycRequest _$SaveKycRequestFromJson(Map<String, dynamic> json) =>
    SaveKycRequest(
      upgradeAccountRequest: UpgradeAccountRequest.fromJson(
          json['upgrade_account_request'] as Map<String, dynamic>),
      personalInfoRequest: PersonalInfoRequest.fromJson(
          json['proofs_of_address'] as Map<String, dynamic>),
      immediateFamilyAffiliation: json['immediateFamilyAffiliation'] as bool?,
      associatesAffiliation: json['associatesAffiliation'] as bool?,
    );

Map<String, dynamic> _$SaveKycRequestToJson(SaveKycRequest instance) =>
    <String, dynamic>{
      'upgrade_account_request': instance.upgradeAccountRequest.toJson(),
      'immediateFamilyAffiliation': instance.immediateFamilyAffiliation,
      'associatesAffiliation': instance.associatesAffiliation,
      'proofs_of_address': instance.personalInfoRequest.toJson(),
    };
