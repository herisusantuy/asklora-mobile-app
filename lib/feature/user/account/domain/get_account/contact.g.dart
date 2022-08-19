// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      json['email_address'] as String,
      json['phone_number_country_code'] as String?,
      json['phone_number'] as String,
      json['street_address'] as String,
      json['city'] as String,
      json['unit'] as String,
      json['state'] as String,
      json['postal_code'] as String,
      json['country'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'email_address': instance.email,
      'phone_number_country_code': instance.countryCode,
      'phone_number': instance.phoneNumber,
      'street_address': instance.streetAddress,
      'city': instance.city,
      'unit': instance.unit,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'country': instance.country,
    };
