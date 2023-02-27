// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Residence _$ResidenceFromJson(Map<String, dynamic> json) => Residence(
      addressLine1: json['address_line_1'] as String?,
      addressLine2: json['address_line_2'] as String?,
      district: json['district'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$ResidenceToJson(Residence instance) => <String, dynamic>{
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'district': instance.district,
      'region': instance.region,
      'country': instance.country,
    };
