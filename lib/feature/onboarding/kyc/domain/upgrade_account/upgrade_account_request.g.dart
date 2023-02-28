// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeAccountRequest _$UpgradeAccountRequestFromJson(
        Map<String, dynamic> json) =>
    UpgradeAccountRequest(
      residenceInfo: json['residence_info'] == null
          ? null
          : ResidenceInfo.fromJson(
              json['residence_info'] as Map<String, dynamic>),
      proofsOfAddress: (json['proofs_of_address'] as List<dynamic>?)
          ?.map((e) => ProofsOfAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      employmentInfo: json['employment_info'] == null
          ? null
          : EmploymentInfo.fromJson(
              json['employment_info'] as Map<String, dynamic>),
      wealthSources: (json['wealth_sources'] as List<dynamic>?)
          ?.map((e) => WealthSources.fromJson(e as Map<String, dynamic>))
          .toList(),
      affiliatedPerson: json['affiliated_person'] == null
          ? null
          : AffiliatedPerson.fromJson(
              json['affiliated_person'] as Map<String, dynamic>),
      agreements: (json['agreements'] as List<dynamic>?)
          ?.map((e) => Agreement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpgradeAccountRequestToJson(
        UpgradeAccountRequest instance) =>
    <String, dynamic>{
      'residence_info': instance.residenceInfo?.toJson(),
      'proofs_of_address':
          instance.proofsOfAddress?.map((e) => e.toJson()).toList(),
      'employment_info': instance.employmentInfo?.toJson(),
      'wealth_sources': instance.wealthSources?.map((e) => e.toJson()).toList(),
      'affiliated_person': instance.affiliatedPerson?.toJson(),
      'agreements': instance.agreements?.map((e) => e.toJson()).toList(),
    };
