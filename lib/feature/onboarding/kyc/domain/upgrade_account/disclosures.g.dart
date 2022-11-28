// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disclosures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Disclosures _$DisclosuresFromJson(Map<String, dynamic> json) => Disclosures(
      isControlPerson: json['is_control_person'] as bool?,
      isAffiliatedExchangeOrFinra:
          json['is_affiliated_exchange_or_finra'] as bool?,
      isPoliticallyExposed: json['is_politically_exposed'] as bool?,
      immediateFamilyExposed: json['immediate_family_exposed'] as bool?,
      employmentStatus: json['employment_status'] as String?,
      employerName: json['employer_name'] as String?,
      employerAddress: json['employer_address'] as String?,
      employmentPosition: json['employment_position'] as String?,
      context: (json['context'] as List<dynamic>?)
          ?.map((e) => Context.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DisclosuresToJson(Disclosures instance) =>
    <String, dynamic>{
      'is_control_person': instance.isControlPerson,
      'is_affiliated_exchange_or_finra': instance.isAffiliatedExchangeOrFinra,
      'is_politically_exposed': instance.isPoliticallyExposed,
      'immediate_family_exposed': instance.immediateFamilyExposed,
      'employment_status': instance.employmentStatus,
      'employer_name': instance.employerName,
      'employer_address': instance.employerAddress,
      'employment_position': instance.employmentPosition,
      'context': instance.context,
    };
