// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidenceInfo _$ResidenceInfoFromJson(Map<String, dynamic> json) =>
    ResidenceInfo(
      addressLine1: json['address_line_1'] as String?,
      addressLine2: json['address_line_2'] as String?,
      district: json['district'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$ResidenceInfoToJson(ResidenceInfo instance) {
  final val = <String, dynamic>{
    'address_line_1': instance.addressLine1,
    'address_line_2': instance.addressLine2,
    'district': instance.district,
    'region': instance.region,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('country', instance.country);
  return val;
}
